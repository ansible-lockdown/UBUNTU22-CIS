# Ubuntu 22 CIS

![Build Status](https://img.shields.io/github/workflow/status/ansible-lockdown/UBUNTU22-CIS/CommunityToDevel?label=Devel%20Build%20Status&style=plastic)
![Build Status](https://img.shields.io/github/workflow/status/ansible-lockdown/UBUNTU22-CIS/DevelToMaster?label=Main%20Build%20Status&style=plastic)
![Release](https://img.shields.io/github/v/release/ansible-lockdown/UBUNTU22-CIS?style=plastic)

Configure Ubuntu 22 machine to be [CIS](https://www.cisecurity.org/cis-benchmarks/) with ubuntu20 (ubuntu22 not released at this time). There are some intrusive tasks that have a toggle in defaults main.yml to disable to automated fix

## Join us

On our [Discord Server](https://discord.gg/JFxpSgPFEJ) to ask questions, discuss features, or just chat with other Ansible-Lockdown users

## Caution(s)

This role **will make changes to the system** that could break things. This is not an auditing tool but rather a remediation tool to be used after an audit has been conducted.

This role was developed against a clean install of the Operating System. If you are implimenting to an existing system please review this role for any site specific changes that are needed.

To use release version please point to main branch
Based on
[CIS_Ubuntu_Linux_22.04_LTS_Benchmark](https://community.cisecurity.org/collab/public/index.php).

## Documentation

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

## Auditing (new)

This can be turned on or off within the defaults/main.yml file with the variable run_audit. The value is false by default, please refer to the wiki for more details.

This is a much quicker, very lightweight, checking (where possible) config compliance and live/running settings.

A new form of auditing has been develeoped, by using a small (12MB) go binary called [goss](https://github.com/aelsabbahy/goss) along with the relevant configurations to check. Without the need for infrastructure or other tooling.
This audit will not only check the config has the correct setting but aims to capture if it is running with that configuration also trying to remove [false positives](https://www.mindpointgroup.com/blog/is-compliance-scanning-still-relevant/) in the process.

Refer to [UBUNTU22-CIS-Audit](https://github.com/ansible-lockdown/UBUNTU22-CIS-Audit).

Further audit documentation can be found at [Audit-Docs](https://github.com/ansible-lockdown/UBUNTU22-CIS-Audit/docs/Security_remediation_and_auditing.md).

## Role Variables

This role is designed that the end user should not have to edit the tasks themselves. All customizing should be done via the defaults/main.yml file or with extra vars within the project, job, workflow, etc. These variables can be found [here](https://github.com/ansible-lockdown/UBUNTU22-CIS/wiki/Main-Variables) in the Main Variables Wiki page. All variables are listed there along with descriptions.

## Branches

- **devel** - This is the default branch and the working development branch. Community pull requests will pull into this branch
- **main** - This is the release branch
- **reports** - This is a protected branch for our scoring reports, no code should ever go here
- **gh-pages** - This is the github pages branch
- **all other branches** - Individual community member branches

## Community Contribution

We encourage you (the community) to contribute to this role. Please read the rules below.

- Your work is done in your own individual branch. Make sure to Signed-off and GPG sign all commits you intend to merge.
- All community Pull Requests are pulled into the devel branch
- Pull Requests into devel will confirm your commits have a GPG signature, Signed-off, and a functional test before being approved
- Once your changes are merged and a more detailed review is complete, an authorized member will merge your changes into the main branch for a new release

## Pipeline Testing

uses:

- ansible-core 2.12
- ansible collections - pulls in the latest version based on requirements file
- runs the audit using the devel branch
- This is an automated test that occurs on pull requests into devel

## Support

This is a community project at its core and will be managed as such.

If you would are interested in dedicated support to assist or provide bespoke setups

- [Ansible Counselor](https://www.mindpointgroup.com/products/ansible-counselor-on-demand-ansible-services-and-consulting/)
- [Try us out](https://engage.mindpointgroup.com/try-ansible-counselor)
