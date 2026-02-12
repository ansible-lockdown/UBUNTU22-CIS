# QA Report: Private-UBUNTU22-CIS

**Date:** 2026-02-12 10:44:58  
**Branch:** priv_feb26_updates  
**Tool Version:** 2.2.0  
**Benchmark Prefix:** ubtu22cis

---

## Summary

| Metric | Count |
|--------|-------|
| Total Checks | 11 |
| Passed | 6 |
| Failed | 2 |
| Warnings | 3 |
| Skipped | 0 |

---

## [PASS] YAML Lint

**Status:** PASS  
**Summary:** 0 issue(s)


---

## [PASS] Ansible Lint

**Status:** PASS  
**Summary:** 0 issue(s)


---

## [PASS] Spell Check

**Status:** PASS  
**Summary:** 0 issue(s)


---

## [WARN] Grammar Check

**Status:** WARN  
**Summary:** 40 issue(s)


| Severity | File | Line | Description |
|----------|------|------|-------------|
| warning | `README.md` | 96 | Repeated word: 'to to' |
| info | `defaults/main.yml` | 63 | Multiple consecutive spaces |
| info | `defaults/main.yml` | 640 | Multiple consecutive spaces |
| info | `defaults/main.yml` | 669 | Multiple consecutive spaces |
| info | `defaults/main.yml` | 701 | Multiple consecutive spaces |
| warning | `defaults/main.yml` | 735 | Repeated word: 'of of' |
| warning | `defaults/main.yml` | 743 | Repeated word: 'of of' |
| info | `defaults/main.yml` | 797 | Multiple consecutive spaces |
| info | `defaults/main.yml` | 845 | Multiple consecutive spaces |
| info | `defaults/main.yml` | 1002 | Multiple consecutive spaces |
| info | `defaults/main.yml` | 1097 | Multiple consecutive spaces |
| info | `defaults/main.yml` | 1102 | Multiple consecutive spaces |
| warning | `defaults/main.yml` | 1153 | Subject-verb disagreement: plural noun + 'is' |
| warning | `defaults/main.yml` | 1202 | Subject-verb disagreement: singular noun + 'are' |
| warning | `defaults/main.yml` | 1273 | Repeated word: 'the the' |
| info | `tasks/prelim.yml` | 29 | Multiple consecutive spaces |
| warning | `tasks/section_5/cis_5.1.x.yml` | 31 | Subject-verb disagreement: plural noun + 'is' |
| warning | `tasks/section_5/cis_5.1.x.yml` | 44 | Subject-verb disagreement: plural noun + 'is' |
| warning | `tasks/section_5/cis_5.1.x.yml` | 52 | Subject-verb disagreement: plural noun + 'is' |
| warning | `tasks/section_5/cis_5.1.x.yml` | 62 | Subject-verb disagreement: plural noun + 'is' |
| warning | `tasks/section_5/cis_5.1.x.yml` | 75 | Subject-verb disagreement: plural noun + 'is' |
| warning | `tasks/section_5/cis_5.1.x.yml` | 83 | Subject-verb disagreement: plural noun + 'is' |
| warning | `tasks/section_5/cis_5.3.1.x.yml` | 20 | Subject-verb disagreement: plural noun + 'is' |
| warning | `tasks/section_6/cis_6.2.3.x.yml` | 27 | Subject-verb disagreement: singular noun + 'are' |
| info | `templates/ansible_vars_goss.yml.j2` | 479 | Multiple consecutive spaces |
| warning | `templates/ansible_vars_goss.yml.j2` | 573 | Repeated word: 'of of' |
| warning | `templates/ansible_vars_goss.yml.j2` | 584 | Repeated word: 'of of' |
| info | `templates/ansible_vars_goss.yml.j2` | 641 | Multiple consecutive spaces |
| info | `templates/chrony.conf.j2` | 26 | Multiple consecutive spaces |
| info | `templates/chrony.conf.j2` | 79 | Multiple consecutive spaces |
| info | `templates/chrony.conf.j2` | 80 | Multiple consecutive spaces |
| info | `templates/chrony.conf.j2` | 81 | Multiple consecutive spaces |
| info | `templates/chrony.conf.j2` | 87 | Multiple consecutive spaces |
| info | `templates/chrony.conf.j2` | 88 | Multiple consecutive spaces |
| info | `templates/chrony.conf.j2` | 89 | Multiple consecutive spaces |
| info | `templates/ntp.conf.j2` | 60 | Multiple consecutive spaces |
| info | `templates/ntp.conf.j2` | 67 | Multiple consecutive spaces |
| info | `templates/ntp.conf.j2` | 68 | Multiple consecutive spaces |
| info | `templates/ntp.conf.j2` | 70 | Multiple consecutive spaces |
| info | `templates/ntp.conf.j2` | 71 | Multiple consecutive spaces |

---

## [WARN] Unused Variables

**Status:** WARN  
**Summary:** 14 issue(s)


| Severity | File | Line | Description |
|----------|------|------|-------------|
| warning | `templates/ansible_vars_goss.yml.j2` | 461 | Referenced but not defined: 'ubtu22cis_squashfs_required' |
| warning | `templates/ansible_vars_goss.yml.j2` | 627 | Referenced but not defined: 'ubtu22cis_auditd' |
| warning | `templates/ansible_vars_goss.yml.j2` | 636 | Referenced but not defined: 'ubtu22cis_syslog' |
| warning | `templates/ansible_vars_goss.yml.j2` | 637 | Referenced but not defined: 'ubtu22cis_is_syslog_server' |
| warning | `templates/ansible_vars_goss.yml.j2` | 664 | Referenced but not defined: 'ubtu22cis_ssh_aliveinterval' |
| warning | `templates/ansible_vars_goss.yml.j2` | 665 | Referenced but not defined: 'ubtu22cis_ssh_countmax' |
| warning | `templates/ansible_vars_goss.yml.j2` | 667 | Referenced but not defined: 'ubtu22cis_pam_password' |
| warning | `templates/ansible_vars_goss.yml.j2` | 671 | Referenced but not defined: 'ubtu22cis_pam_passwd_retry' |
| warning | `templates/chrony.conf.j2` | 18 | Referenced but not defined: 'ubtu22cis_time_synchronization_servers' |
| warning | `templates/chrony.conf.j2` | 19 | Referenced but not defined: 'ubtu22cis_chrony_server_options' |
| warning | `templates/chrony.conf.j2` | 93 | Referenced but not defined: 'ubtu22cis_chrony_user' |
| warning | `templates/etc/systemd/system/aidecheck.timer.j2` | 7 | Referenced but not defined: 'ubtu22cis_aide_cron' |
| warning | `templates/usr/share/pam-configs/pam_unix.j2` | 23 | Referenced but not defined: 'ubtu22cis_rule_5' |
| warning | `handlers/main.yml` | 250 | Referenced but not defined: 'ubtu22cis_rule_4_1_3_21_augen_check' |

---

## [WARN] Variable Naming

**Status:** WARN  
**Summary:** 7 issue(s)


| Severity | File | Line | Description |
|----------|------|------|-------------|
| warning | `tasks/post_remediation_audit.yml` | 29 | Duplicate register variable 'post_audit_summary' (first seen in tasks/post_remediation_audit.yml:17) |
| warning | `tasks/pre_remediation_audit.yml` | 100 | Duplicate register variable 'pre_audit_summary' (first seen in tasks/pre_remediation_audit.yml:88) |
| warning | `tasks/section_1/cis_1.1.2.2.x.yml` | 22 | Duplicate register variable 'discovered_tmp_mount' (first seen in tasks/section_1/cis_1.1.2.1.x.yml:22) |
| warning | `tasks/section_1/cis_1.3.1.x.yml` | 153 | Duplicate register variable 'discovered_apparmor_pre_count' (first seen in tasks/section_1/cis_1.3.1.x.yml:105) |
| warning | `tasks/section_1/cis_1.3.1.x.yml` | 164 | Duplicate register variable 'discovered_apparmor_post_count' (first seen in tasks/section_1/cis_1.3.1.x.yml:116) |
| warning | `tasks/section_6/cis_6.2.1.x.yml` | 53 | Duplicate register variable 'discovered_grub_cmdline_settings' (first seen in tasks/section_3/cis_3.1.x.yml:29) |
| warning | `tasks/section_6/cis_6.2.1.x.yml` | 90 | Duplicate register variable 'discovered_grub_cmdline_settings' (first seen in tasks/section_3/cis_3.1.x.yml:29) |

---

## [PASS] File Mode Quoting

**Status:** PASS  
**Summary:** 0 issue(s)


---

## [PASS] Company Naming

**Status:** PASS  
**Summary:** 0 issue(s)


---

## [FAIL] Audit Template

**Status:** FAIL  
**Summary:** 1 issue(s)


| Severity | File | Line | Description |
|----------|------|------|-------------|
| warning | `templates/ansible_vars_goss.yml.j2` | 592 | Duplicate audit key 'options' (first at line 581) |

---

## [PASS] FQCN Usage

**Status:** PASS  
**Summary:** 0 issue(s)


---

## [FAIL] Rule Coverage

**Status:** FAIL  
**Summary:** 1 issue(s)


| Severity | File | Line | Description |
|----------|------|------|-------------|
| error | `handlers/main.yml` | 250 | Rule used in tasks but not defined: 'ubtu22cis_rule_4_1_3_21_augen_check' |

---

