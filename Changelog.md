# Ubuntu22CIS

## Based on CIS V1.0.0

### v1.0.1

Issues:
Thank to the discord community for feedback on these and the following issues

- [#25](https://github.com/ansible-lockdown/UBUNTU22-CIS/issues/25)
  - thanks to @bgro
- [#27](https://github.com/ansible-lockdown/UBUNTU22-CIS/issues/27)
  - thanks to @FaisalAli92
- [#30](https://github.com/ansible-lockdown/UBUNTU22-CIS/issues/30)
  - thanks to @zac90
- [#31](https://github.com/ansible-lockdown/UBUNTU22-CIS/issues/31)
  - thanks to @zac90

Thanks to @treyperonne for the PR [#29](https://github.com/ansible-lockdown/UBUNTU22-CIS/pull/29/files) integrated to this PR

## V1.0 based on v1.0.0

Issues:

- [#25](https://github.com/ansible-lockdown/UBUNTU22-CIS/issues/25)
- [#27](https://github.com/ansible-lockdown/UBUNTU22-CIS/issues/27)

PRs incorporated

- [#5](https://github.com/ansible-lockdown/UBUNTU22-CIS/pull/5/files)

## v0.9 based on v1.0.0

## April 2023 Updates

- Yamllint Check
- Ansible-lint Check
- Fqcn[canonical] module name
- PR's Addressed
  - [#21](https://github.com/ansible-lockdown/UBUNTU22-CIS/pull/21) - #Thanks @IdrisDose
- Bugs Fixed
  - [#13](https://github.com/ansible-lockdown/UBUNTU22-CIS/issues/13) - Thanks @vdmkenny
  - [#14](https://github.com/ansible-lockdown/UBUNTU22-CIS/issues/14) - Thanks @bgro
  - [#15](https://github.com/ansible-lockdown/UBUNTU22-CIS/issues/15) - Thanks @bgro
  - [#16](https://github.com/ansible-lockdown/UBUNTU22-CIS/issues/16) - Thanks @bgro
  - [#17](https://github.com/ansible-lockdown/UBUNTU22-CIS/issues/17) - Thanks @bgro
  - [#18](https://github.com/ansible-lockdown/UBUNTU22-CIS/issues/18) - Thanks @bgro
  - [#19](https://github.com/ansible-lockdown/UBUNTU22-CIS/issues/19) - Thanks @bgro
  - [#20](https://github.com/ansible-lockdown/UBUNTU22-CIS/issues/20) - Thanks @bgro

## Initial ubuntu22cis release

- Ansible 2.10.1 minimum
- fqcns added
- audit alignment to use corresponding benchamrk version
- many lint improvements
- All required changes for CIS 1.0.0 (very different from original base of ubuntu2004)

### New options

- default firewall now ufw

- If firewall = UFW to use system sysctl settings: default
  - _ubtu22cis_ufw_use_sysctl: true_

- Abilty to set alternate sysctl file for network settings: default
  - _ubtu22cis_sysctl_network_conf: /etc/sysctl.conf_

- Abilty to set syslog service: choose between rsyslog or journald: default
  - _ubtu22cis_syslog_service: rsyslog_
