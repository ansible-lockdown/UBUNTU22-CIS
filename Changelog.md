# v0.9 Ubuntu22cis v1.0.0

## Initial ubuntu22cis release

Ansible 2.10.1 minimum
fqcns added

### New options

- default firewall now ufw

- If firewall = UFW to use system sysctl settings: default
  - _ubtu22cis_ufw_use_sysctl: true_

- Abilty to set alternate sysctl file for network settings: default
  - _ubtu22cis_sysctl_network_conf: /etc/sysctl.conf_

- Abilty to set syslog service: choose between rsyslog or journald: default
  - _ubtu22cis_syslog_service: rsyslog_
