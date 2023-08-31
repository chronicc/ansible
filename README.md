# Ansible

A collection of ansible playbooks for managing my infrastructure.

## Getting started

- Install pyenv.
- Install poetry. Run `curl -sSL https://install.python-poetry.org | python3 -`
- Setup the virtualenv. Run `poetry install`
- Switch into the virtualenv. Run `poetry shell`
- Checkout submodules. Run `git submodule update --init --recursive`
- Install collections. Run `ansible-galaxy install -r requrirements.yml`
- Run a playbook. Run `ansible-playbook -i INVENTORY playbooks/PLAYBOOK`

## Development

- Install pre-commit. Run `pre-commit install`
