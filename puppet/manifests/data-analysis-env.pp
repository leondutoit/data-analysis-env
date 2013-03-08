## This file sets up the working environment in the VM

class utilities {

    package {'emacs':
        ensure => 'present',
        require => Exec[run-update],
    }

    exec {'run-update':
        provider => shell,
        command => '/usr/bin/apt-get update;',
    }

}

include wget

class r_env {

    # Use the relevant Ubuntu box with the cran mirror
    # Install latest version of R
    exec {'prepare-r-install-env':
        provider => shell,
        creates => '/usr/lib/R',
        command => 'echo "deb http://cran.uib.no/bin/linux/ubuntu precise/" >> /etc/apt/sources.list;
            /usr/bin/apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9;
            /usr/bin/apt-get update;',
    }

    # Get the core environment
    package {['r-base', 'r-base-core', 'r-recommended', 'r-base-html']:
        ensure => 'present',
        require => Exec[prepare-r-install-env],
    }

    # Install useful packages
    exec {'install-r-packages':
        provider => shell,
        require => Package['r-base'],
        creates => '/tmp/installed-r-packages',
        command => '/usr/bin/R -f /vagrant/usefulpackages.R;
            echo "TRUE" >> /tmp/installed-r-packages;',
    }

}

class python_env {

    package {['python-pip', 'python-numpy']:
        ensure => installed,
    }

    package {['python-pandas']:
        require => Package[python-numpy],
        ensure => installed,
    }

    exec {'python-analysis-env':
        require => Package[python-pip], # create this resource
        provider => shell,
        command => '/usr/bin/pip install ipython;', # include flask, pymongo
    }

}


# Include classes in VM
include utilities
include r_env
include python_env




