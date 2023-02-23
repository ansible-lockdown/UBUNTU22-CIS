# Ubuntu 22.04 LTS CIS Benchmark Ansible Role

This is an Ansible for Ubuntu 22.04 LTS whose primary function is to apply
remediations that conform to the `Level 1 - Server` profile.

The role is based on [ansible-lockdown's](https://github.com/ansible-lockdown/UBUNTU22-CIS).
At the time of writing ([2023/02/23](https://github.com/ansible-lockdown/UBUNTU22-CIS/tree/3b62b12aa2da0ed353a90be80c069bc544a4004e)),
the role is a light update from their 20.04 LTS role to achieve a working MVP
for 22.04 LTS server targets.  This role is heavily modified to align directly
to the 22.04 v1.0 benchmark and provides 90%+ profile coverage for
`Level 1 - Server`.

## Caution(s)

This role assumes a clean install of the Operating System before application. If you are implimenting to an existing system please review this role for any site specific changes that are needed.

## Documentation

>The following links are to the original Ansible Lockdown documentation
>as the role continues to follow their administrative conventions with
>the updates that have been applied.

- [Getting Started](https://www.lockdownenterprise.com/docs/getting-started-with-lockdown)
- [Customizing Roles](https://www.lockdownenterprise.com/docs/customizing-lockdown-enterprise)
- [Per-Host Configuration](https://www.lockdownenterprise.com/docs/per-host-lockdown-enterprise-configuration)
- [Getting the Most Out of the Role](https://www.lockdownenterprise.com/docs/get-the-most-out-of-lockdown-enterprise)
- [Wiki](https://github.com/ansible-lockdown/UBUNTU22-CIS/wiki)
- [Repo GitHub Page](https://ansible-lockdown.github.io/UBUNTU22-CIS/)

## Requirements

**General:**

- Basic knowledge of Ansible, below are some links to the Ansible documentation to help get started if you are unfamiliar with Ansible
  - [Main Ansible documentation page](https://docs.ansible.com)
  - [Ansible Getting Started](https://docs.ansible.com/ansible/latest/user_guide/intro_getting_started.html)
  - [Tower User Guide](https://docs.ansible.com/ansible-tower/latest/html/userguide/index.html)
  - [Ansible Community Info](https://docs.ansible.com/ansible/latest/community/index.html)
- Functioning Ansible and/or Tower Installed, configured, and running. This includes all of the base Ansible/Tower configurations, needed packages installed, and infrastructure setup.
- Please read through the tasks in this role to gain an understanding of what each control is doing. Some of the tasks are disruptive and can have unintended consiquences in a live production system. Also familiarize yourself with the variables in the defaults/main.yml file or the [Main Variables Wiki Page](https://github.com/ansible-lockdown/UBUNTU22-CIS/wiki/Main-Variables).

**Technical Dependencies:**

- Running Ansible/Tower setup (this role is tested against Ansible version 2.9.1 and newer)
- Python3 Ansible run environment

## Role Variables

This role is designed that the end user should not have to edit the tasks themselves. All customizing should be done via the defaults/main.yml file or with extra vars within the project, job, workflow, etc. These variables can be found [here](https://github.com/ansible-lockdown/UBUNTU22-CIS/wiki/Main-Variables) in the Main Variables Wiki page. All variables are listed there along with descriptions.

## Branches

- **devel** - This is the default branch and the working development branch. Community pull requests will pull into this branch
- **main** - This is the release branch
- **reports** - This is a protected branch for our scoring reports, no code should ever go here
- **gh-pages** - This is the github pages branch
- **all other branches** - Individual community member branches
