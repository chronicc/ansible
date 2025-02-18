Ansible
=======

![tests](https://github.com/chronicc/ansible/actions/workflows/tests.yml/badge.svg?branch=main)

A collection of ansible playbooks for managing my infrastructure and testing concepts.

Getting started
---------------

### Checkout submodules

```shell
git submodule update --init --recursive
```

### Run a playbook

```shell
ansible-playbook -i inventory/production/hosts.ini playbooks/00-initialize-node.yml`
```

Development
-----------

- Install pre-commit hooks. Run `pre-commit install`
