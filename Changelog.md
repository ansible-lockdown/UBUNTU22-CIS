# Ubuntu22CIS

## Based on CIS V1.0.0

### 1.1.1

- Huge thanks to
  - @rostskadat
    - #175 - Allowing changes to the ssh default variables
  - @DianaMariaDDM
    - #200 - new approach to tmp mount options

### 1.1.0

- #223 thanks to feedback @txsastre
- audit
  - moved the audit to run prior to any changes taking place on the system (exception of required)
  - improvements to copy/archive/get_url content methods incl notes in defaults/main.yml
  - tidy up and logic of var naming
- lint and tidy up
- ansible version update
- unused filesystem added to skip if container list
- unused vars removed

### 1.0.9

- updated audit command to allow multiple groups from inventory
- #144 usb-blacklisting - thanks to @paulquevedojdrf
- #152 and #170 Added ssh validate to tasks - thanks to @dderemiah and @twadelij
- #180 and #181 password reuse 5.3.4 - thanks to @DianaMariaDDM
- #182 pwquality enhancement New variable to allow extended or minclass (default)options - thanks to @ma3s7ro
- #184 Initial container config feedback required - thanks to @ipruteanu-sie
- #204 reboot not idempotent - changed auditd and reboot logic update to 4.1.3.6 discovery - thanks to @bhuddah

### 1.0.8

- updated goss binary to 0.4.4
- moved majority of audit variables to vars/audit.yml
- new function to enable audit_only using remediation
- removed some dupes in audit config

### 1.0.7

Huge thanks to the discord community
Thanks to @loz for all the testing and feedback

- 1.7.1 added dymamic check to audit
- 4.1.4.1 & 4.1.4.5 improved logic
- ssh default groups emptied
- bootloader password default now false and improved test
- audit updates for documentation
- 1.1.1.2 conditional logic improvement
- 4.2.3 ensure checking for hidden logfiles
- sshd ciphers/macs/kex all now lists to allow greater testing
- correction to cis level
- section 6.1 mode updates

@Petri and @Loz for all the testing on this partcular issue

- rule 5.4.2 logic and extra variables added in defaults/main.yml

thanks to @bgro

- #131
- #148

thanksto @tomi-bigpi

- #123

thanks to @jovial

- #132

thanks to @paulquevedojdrf

- #135
- #136

thanks to @zac90

- #138
- #139
- #140
- #141
- #142
- #143
- #145

thanks to @dderemiah

- #146

thanks to @lozzolloz

- #151
- #153
- #154

thanks to @brisky

- #158

thanks to Jeroen0494

- #161

thanks to @r0bc94

- #164

### v1.0.6

collections links updates since galaxy-ng changes and older ansible versions not supported
README also updates as quality scores inconsistent since change

- #120 thanks you @zac90
- #121 thanks to @ipruteanu-sie
- #124 thanks to @ipruteanu-sie
- #125 thanks to @ipruteanu-sie
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
