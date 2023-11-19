# Ansible

![tests](https://github.com/chronicc/ansible/actions/workflows/tests.yml/badge.svg?branch=main)

A collection of ansible playbooks for managing my infrastructure and testing concepts.

## Getting started

From inside of the repository do the following things.

### Install dependencies for rtx

#### Ubuntu

```shell
sudo apt install build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev curl \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
```

### Install rtx

```shell
sudo bash -c "curl https://rtx.pub/rtx-latest-linux-x64 > /usr/local/bin/rtx"
sudo chmod +x /usr/local/bin/rtx
eval "$(rtx activate bash)"
rtx trust
rtx install
```

### Checkout submodules

```shell
git submodule update --init --recursive
```

### Install poetry dependencies

```shell
poetry install
```

### Install Ansible roles and collections

```shell
ansible-galaxy install -r requrirements.yml
```

### Run a playbook

```shell
ansible-playbook -i inventory/vagrant.ini playbooks/00-initialize-node.yml`
```

## Development

- Install pre-commit hooks. Run `pre-commit install`
