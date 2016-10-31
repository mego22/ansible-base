Base
=========

This is the base role for my [Ansible](https://ansible.com) roles. Included with the standard Ansible directory structure is a setup for using [test-kitchen](http://kitchen.ci/) with [Docker](https://docker.com) for TDD.

How to use
----------

    git clone git@github.com:mego22/ansible-base.git new-role
    cd new-role/
    perl -pi -e s,ansible-base,new-role, ./test/integration/default/default.yml
    rm -rf .git
    git init
    git add .
    git commit -m "Initial commit."
    git remote add origin git@github.com:USER/new-role.git
    push -u origin master

TDD
---
### Prerequisites
* [Ansible](http://docs.ansible.com/ansible/intro_installation.html)
* [Docker](https://docs.docker.com/engine/installation/)
* [Ruby](https://rvm.io/rvm/install)
* [Bundler](http://bundler.io/)
* [Ansible-lint](https://github.com/willthames/ansible-lint)
* make

### The Makefile
The Makefile is used as a wrapper for frequently run tasks. Mostly its wrapping `bundle exec kitchen`.

    converge  kitchen converge
    create    kitchen create
    destroy   kitchen destroy
    lint      ansible-lint
    list      kitchen list
    login     kitchen login
    setup     Install needed gems for test-kitchen
    syntax    ansible-playbook syntax-check
    test      kitchen test
    verify    kitchen verify
