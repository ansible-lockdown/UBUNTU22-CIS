# Ubuntu22CIS

## Based on CIS V1.0.0

### v1.0.6

collections links updates since galaxy-ng changes and older ansible versions not supported
README also updates as quality scores inconsistent since change

- #120 thanks you @zac90
- #121 thanks to @ipruteanu-sie
- #124 thanks to @ipruteanu-sie
- #126 thanks to @ipruteanu-sie
- #128 thanks to @dderemiah

### V1.0.5

updated import_tasks to state file

issues addressed
thanks to @bgro

- #79
- #80
- #81
- #82

adopted PR changed
thanks to @andrejzverev

- #63

### v1.0.4

Several issues addressed
Version of goss updated along with associated audit content
linting update
pre-commit added

- #59
- #61
- #62
- #64
- #67
- #69

### v1.0.3

Issues:
Thanks to @zac90

- [#53](https://github.com/ansible-lockdown/UBUNTU22-CIS/issues/53)
- [#54](https://github.com/ansible-lockdown/UBUNTU22-CIS/issues/54)
- [#55](https://github.com/ansible-lockdown/UBUNTU22-CIS/issues/55)

PR:
thanks to @rspataru

- [#50](https://github.com/ansible-lockdown/UBUNTU22-CIS/pull/50)

Updates to workflow now using centralised config
templates removed as inherited from org
legacy workflow files removed

lint file updates
readme updates to badges and layout
added secrets-baseline in preperation for pre-commit
readme tidy up

## v1.0.2

- issues addressed
  - thanks to @zac90
    - [#35](https://github.com/ansible-lockdown/UBUNTU22-CIS/issues/35)
    - [#36](https://github.com/ansible-lockdown/UBUNTU22-CIS/issues/36)
    - [#37](https://github.com/ansible-lockdown/UBUNTU22-CIS/issues/37)
    - [#39](https://github.com/ansible-lockdown/UBUNTU22-CIS/issues/39)
    - [#40](https://github.com/ansible-lockdown/UBUNTU22-CIS/issues/40)
    - [#41](https://github.com/ansible-lockdown/UBUNTU22-CIS/issues/41)
    - [#42](https://github.com/ansible-lockdown/UBUNTU22-CIS/issues/42)
    - [#43](https://github.com/ansible-lockdown/UBUNTU22-CIS/issues/43)
    - [#44](https://github.com/ansible-lockdown/UBUNTU22-CIS/issues/44)
    - [#45](https://github.com/ansible-lockdown/UBUNTU22-CIS/issues/45)

Improvements to the mount commands and fstype usage as part of [#37](https://github.com/ansible-lockdown/UBUNTU22-CIS/issues/37)
section 5.4 tags updated
.ansible-lint updated
improvements to 5.5.4 for umask

### v1.0.1

Issues:
Thank to the discord community for feedback on these and the following issues

- [#25](https://github.com/ansible-lockdown/UBUNTU22-CIS/issues/25)
  - thanks to @bgro
- [#27](https://github.com/ansible-lockdown/UBUNTU22-CIS/issues/27)
  - thanks to @FaisalAli92
- [#30](https://github.com/ansible-lockdown/UBUNTU22-CIS/issues/30)
- [#31](https://github.com/ansible-lockdown/UBUNTU22-CIS/issues/31)
- [#33](https://github.com/ansible-lockdown/UBUNTU22-CIS/issues/33)
  - thanks to @zac90

- [[#32](https://github.com/ansible-lockdown/UBUNTU22-CIS/issues/32)
  - thanks to @twadelij

Thanks to @treyperonne for the PR [#29](https://github.com/ansible-lockdown/UBUNTU22-CIS/pull/29/files) integrated to this PR

Update to the issue [#13](https://github.com/ansible-lockdown/UBUNTU22-CIS/issues/13) improvements to the prelim checks

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
