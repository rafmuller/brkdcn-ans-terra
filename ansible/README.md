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

## Step 4 - Clone this git repository

You will need to have Git installed on your system. If you don't have it installed, you can download it from [here](https://git-scm.com/downloads). To clone the repository, run the following command:

```bash 
git clone https://github.com/rafmuller/brkdcn-ans-terra.git
```

With the repository cloned you may want to delete the .git directory in this respository since you will be creating your own repository. Then once you update this skeleton repository you will then want to create your own repository and push the changes to your repository.

## Step 5 - Update the inventory file

In the directory you will need to setup update the inventory file to point to your own ACI fabric or simulator. The inventory file is located in the root directory of the repository which we have called fabric.yaml. Since this example is focused on multiple fabrics, each fabric will get their unique file. Make sure to properly update the group and hosts inside of the inventory such that they match the group_vars and host_vars.

## Step 6 - Set the environment variables with credentials for the ACI fabric

This ansible playbook uses environment variables to store the credentials for the ACI fabric. You will need to set the following environment variables:

```bash
export APIC_USERNAME=your_username
export APIC_PASSWORD=your_password
```

## Using the respoitory

This repository is designed with two modes of operation. One is to treat the repository as infrastructure as code, where the source of truth resides in the repository data structures. In this mode you operate all changes from ansible towards the ACI fabric. The second method is procedural, where you use the repository as a way to perform transactional changes to the ACI fabric.

We have provided you with a base set of playbooks that you can modify as your needs require. The playbooks are located in the playbooks directory. The playbooks are structured around the fabrics. This is due to past experience that finds is easier to manage. 

### Infrastructure as code mode

In this mode the distinct data models in the host_vars and group_vars have to be defined for either present or absent. This allows for specific item deletion once create. As an example if you created 10 static paths for an EPG and want to delete one, then that particular one would have to be changed in state to absent in the data structure which upon execution would delete that particular static path.

```bash
ansible-playbook -i fabric1.yaml playbooks/fabric1/access-policies/fab1-ap.yaml --tags iac
```

### Procedural mode

In procedural mode the playbooks are designed to either create or delete whatever you are requesting. So in this case if you create various obhects with a single change in the tags you could delete what you just created. The difference between iac mode and procedural is that the state of the objects ( present or absent ) is defined in the specific task based no the tags. 

```bash
ansible-playbook -i fabric1.yaml playbooks/fabric1/access-policies/fab1-ap.yaml --tags create
```

Or if you wish to delete then:

```bash
ansible-playbook -i fabric1.yaml playbooks/fabric1/access-policies/fab1-ap.yaml --tags delete
```

