Base
=========

This is the base role for my personal projects.

Role Variables
--------------

host_name: what the instance hostname should be

TDD
---
```
git clone ansible-base
cd ansible-base
bundle install --path vendor/bundle
bundle exec kitchen test
```

NOTES
-----
[TDD w/Ansible](http://www.slideshare.net/MartinEtmajer/testing-ansible-roles-with-test-kitchen-serverspec-and-rspec-48185017)
