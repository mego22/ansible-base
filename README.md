Base
=========

This is the base role for my [Ansible](https://ansible.com) roles. Included with the standard Ansible directory structure is a setup for using [test-kitchen](http://kitchen.ci/) with [Docker](https://docker.com) for TDD.

How to use
----------

    git clone git@github.com:mego22/ansible-base.git new-role
    cd new-role/
    rm -rf .git
    git init
    git add .
    git commit -m "Initial commit."
    git remote add origin git@github.com:USER/new-role.git
    push -u origin master

TDD
---
### Prerequisites
* Ansible
* Docker
* Ruby
* Bundler
* Ansible-lint
* make

The Makefile is used as a wrapper for frequently run tasks. Mostly its wrapping `bundle exec kitchen`.

### Make commands
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
