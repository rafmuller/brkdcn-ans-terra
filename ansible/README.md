# Example repository for Cisco Live breakout session BRKDCN-2606

This repository is built to support the Cisco Live breakout session BRKDCN-2606. The repository contains the directory structure, example playbooks and roles to create a great foundation when working with Ansible and Cisco ACI.

## Step 1: Install pyenv

Pyenv is a tool that allows you to manage multiple versions of Python on your system. This is useful when you need to work with different versions of Python for different projects on your computer. To install pyenv, please visit the [repository site](https://github.com/pyenv/pyenv?tab=readme-ov-file#installation).  Also you have to install pyenv virtualenv plugin that is located [here](https://github.com/pyenv/pyenv-virtualenv).

Make sure to install the environment variables in your shell profile as detailed in the installation instructions. Without this pyenv will not work correctly.

## Step 2: Create a virtual environment

To install the latest version of python 3.10 run:

```bash
pyenv install 3.10
```

To create a virtual environment for the project run:

```bash
pyenv virtualenv 3.10 cisco-live
```

Then on the root directory for the ansible repository run:

```bash
pyenv local cisco-live
```

## Step 3:  Install ansible and other dependencies

To install ansible:

```bash
pip install ansible-core ansible-lint
```

And to install the cisco.aci collection run:

```bash
ansible-galaxy collection install cisco.aci
ansible-galaxy collection install ansible.posix
ansible-galaxy collection install community.general
```

<!-- ## Step 4: Setup ansible.cfg

To avoid problems on what python interpreter to use, create an ansible.cfg file on the root directory of the repository with the following content:

```ini
[defaults]
collections_path = /path/to/homedir/.ansible/collections/ansible_collections
ansible_python_interpreter=

callback_whitelist=ansible.posix.timer,ansible.posix.profile_tasks,ansible.posix.profile_roles
callbacks_enabled=ansible.posix.timer,ansible.posix.profile_tasks,ansible.posix.profile_roles
stdout_callback = community.general.yaml
bin_ansible_callbacks = True
``` -->

