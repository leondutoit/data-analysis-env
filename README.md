An out-of-the-box data analysis environment for Python and R
============================================================

This repo gives you a virtual Ubuntu 12.04 Linux OS with R and Python - pre-installed with

Why?
----

To my mind, there are three main use-cases where taking advatage of this VM setup would be massively beneficial:

1. For the beginner (in the environment or language): it removes the hassle of setting up the environment - doing this can, unfortunately, be a massive pain and sometimes even discourage people from using the tool altogether.

2. For those who want to develop, do research and analysis in a reproducible way: sharing a distributed version controlled repository with code, data and a virtual machine with the runtime environment is an extremely scientific powerful tool. You effectively share your laboratry with others.

3. For the teacher/presenter: doing tutorial sessions where your effectiveness depends on the state of each participant's operating system is simply not workable. Get rid of those dependencies by distributing a pre-made working environment to your pariticipants/students.


Included packages
-----------------

R
-
- devtools
- ggplot2
- plyr
- reshape2
- lubridate
- stringr
- RCurl
- RJSONIO
- shiny

Python
------
- Numpy
- Pandas
- IPython


Download and intall instructions
--------------------------------

1. Install Oracle Virtual Box: http://download.virtualbox.org/virtualbox/4.2.0/
2. Install Vagrant: http://downloads.vagrantup.com/tags/v1.0.6
3. Install Virtual Box Guest Additions: `vagrant gem install vagrant-vbguest`
4. Checkout this repository: `git clone git://github.com/leondutoit/data-analysis-env.git`
5. Navigate to the repository folder locally: `cd data-analysis-env`
6. Run: `vagrant up`
7. If that does not work run: `vagrant destroy; vagrant up`
8. If that seemed like magic then read the Vagrant link in the information link below - it will demystify everything
9. Customise as you please :)

Workflow on the command-line
----------------------------
1. `vagrant ssh; cd /vagrant/`
2. `R` or `ipython`



Helpful information and thanks
------------------------------

For a great introduction to how vagrant works you can read the docs at: http://docs.vagrantup.com/v1/docs/getting-started/index.html

Thanks to [Jakub Holy](https://twitter.com/HolyJak) for taking the time to introduce me to the power of Vagrant and Puppet!

