# Changelog — Private-UBUNTU22-CIS

## Based on CIS v3.0.0 - Branch [2026_April_QA]

### Molecule Testing

**Test Results:** Converge PASSED (ok=249, changed=84, failed=0), Verify PASSED (audit score improved: 209 → 140 failures)

#### Fixed (Molecule Findings)

- **Rule 3.1.2:** Fixed broken conditional — `prelim_wireless_adapters_exist` (registered dict) used directly as bool in `when:` clause, fails on ansible-core 2.19+. Added `is not skipped` guard + `.stdout | length > 0` check
- **post.yml:** Added missing `reboot_warning_changed_when` variable to `vars/main.yml` — referenced at post.yml:38 but never defined, causing fatal error during post-remediation
- **tasks/main.yml:** Added `community.docker.docker` to container connection detection — FQCN connection plugin was not recognized, preventing container variable loading

#### Changed (Molecule Findings)

- **vars/is_container.yml:** Added 44 auditd rules to container skip list — auditd service (6.2.1.2-4), configuration (6.2.2.1-20), and audit rules (6.2.3.1-21) all require kernel audit subsystem unavailable in containers

#### Fixed (Duplicate Register Variables)

- **post_remediation_audit.yml:** Renamed duplicate `post_audit_summary` to `post_audit_summary_json` and `post_audit_summary_documentation` (aligned with UB20-CIS convention)
- **pre_remediation_audit.yml:** Renamed duplicate `pre_audit_summary` to `pre_audit_summary_json` and `pre_audit_summary_documentation`
- **cis_1.1.2.2.x.yml:** Renamed `discovered_tmp_mount` to `discovered_dev_shm_mount` for /dev/shm mount check (was colliding with /tmp mount in cis_1.1.2.1.x.yml)
- **cis_1.3.1.x.yml:** Renamed `discovered_apparmor_pre_count` / `discovered_apparmor_post_count` in rule 1.3.1.3 to `discovered_apparmor_complain_pre_count` / `discovered_apparmor_complain_post_count` (was colliding with 1.3.1.4 enforce counts)
- **cis_6.2.1.x.yml:** Renamed `discovered_grub_cmdline_settings` in rule 6.2.1.3 to `discovered_grub_cmdline_audit_settings` and in rule 6.2.1.4 to `discovered_grub_cmdline_backlog_settings` (was colliding with 3.1.1 IPv6 grub check)

#### Added (Molecule Findings)

- **molecule/default/:** Docker test scenario for Ubuntu 22.04 with audit verification (molecule.yml, prepare.yml, converge.yml, verify.yml)
- **molecule/localhost/:** Delegated local test scenario (molecule.yml, converge.yml, verify.yml)
- **molecule/wsl/:** WSL delegated test scenario (molecule.yml, converge.yml, verify.yml)

#### Changed (Defaults & Code Quality)

- **defaults/main.yml:** Aligned header comments with UB20-CIS structure — added role identification, variable precedence warning, `system_is_container`, UID discovery variables (`discover_int_uid`, `min_int_uid`, `max_int_uid`), `system_is_ec2`, `ubtu22cis_skip_for_test`
- **defaults/main.yml:** Removed duplicate variables (`system_is_ec2`, `discover_int_uid`, `min_int_uid`, `max_int_uid`) that appeared twice after restructuring
- **tasks/main.yml:213:** Fixed last remaining absolute mode notation (`u=rwx,go=rx` → `go-w`) — all mode directives now use relative/negative notation matching UB20-CIS
- **48 shell tasks:** Added `set -o pipefail` to all `ansible.builtin.shell` tasks with pipes across 17 files using RHEL10-CIS multiline block style (`shell: |\n  set -o pipefail\n  command`) with `args: executable: /bin/bash` — Ubuntu's `/bin/sh` is `dash` which doesn't support pipefail
- **prelim.yml, cis_5.4.2.x.yml:** Fixed 3 escaped quote issues (`\"` → `"`) that broke when converting from inline to block scalar YAML style

#### Fixed (Community-Reported Issues)

- **cis_4.1.x.yml:** Fixed `ubtu22cis_ufw_allow_out_ports: "all"` causing `Invalid data passed to 'loop'` error — task now handles both string `"all"` (allow all outbound) and list of port dicts (specific ports). (fixes [#328](https://github.com/ansible-lockdown/UBUNTU22-CIS/issues/328)) - Thank you @tmeckel
- **prelim.yml, cis_1.2.2.x.yml, cis_6.3.x.yml:** Replaced 7 hardcoded `lock_timeout: 180` with configurable `ubtu22cis_apt_lock_timeout` variable — prevents apt/dpkg lock failures when unattended-upgrades is running. (fixes [#330](https://github.com/ansible-lockdown/UBUNTU22-CIS/issues/330)) - Thank you @tmeckel
- **cis_5.3.3.4.x.yml:** Added file existence check before `replace` on `/usr/share/pam-configs/pam_unix` — prevents failure when pam_unix config file doesn't exist (CI pipeline fix)

#### Security

- **main.yml, cis_5.4.1.x.yml, cis_7.2.x.yml:** Added `no_log: true` to 8 tasks that read `/etc/shadow` — prevents password hashes from being exposed in Ansible logs and stdout

#### Code Style

- **24 tasks:** Converted single-item `when:` lists to inline format across 12 files — matches Lockdown convention
- **68 loop tasks:** Added `loop_control: label` to all loop/with_items tasks — prevents verbose item dumps in Ansible output. Also fixed `fix_loop_control.py` script bug that placed loop_control at block level instead of inner task level

#### RHEL10-CIS Alignment

- **cis_2.1.x.yml:** Applied package-aware masking pattern to 19 systemd mask tasks — uses `ternary(false, omit)` to only stop/disable services when the package is installed, preventing failures on systems where the package was never installed (aligned with RHEL10-CIS)
- **cis_3.1.x.yml:** Applied same ternary pattern to bluetooth service masking
- **tasks/main.yml:** Simplified root password check — replaced complex grep pattern with `awk '{print $2}'` and direct status check `stdout not in ['P', 'L']` (aligned with RHEL10-CIS)
- **60 discovery tasks:** Added `check_mode: false` to all shell/command tasks with `register:` across 25 files — ensures discovery tasks run in `--check` mode so dependent tasks don't fail on undefined variables (aligned with RHEL10-CIS)
- **34 discovery tasks:** Replaced broad `failed_when: false` with specific `failed_when: <var>.rc not in [0, 1]` — catches real errors (rc=2+) while allowing "no matches" (rc=1). Kept `failed_when: false` on action commands (chage, passwd, useradd) and pwck tasks (SIGPIPE rc=141) (aligned with RHEL10-CIS)
- **cis_1.1.2.1.x.yml:** Refactored tmp mount from monolithic template (`tmp.mount.j2`) to systemd drop-in directory pattern (`/etc/systemd/system/tmp.mount.d/60-options.conf`) — more maintainable, doesn't override entire mount unit (aligned with RHEL10-CIS)
- **58 loop_control labels:** Fixed indentation — `label:` must be indented 2 spaces under `loop_control:`, not at the same level

#### QA Validation

- Main QA tool: PASS on Rule Coverage, File Mode Quoting, Company Naming, Audit Template, FQCN Usage, Spell Check, Grammar Check
- Standalone checks: 306/306 rule coverage, 0 duplicate registers, 0 duplicate defaults, 0 absolute/octal modes
- Cross-repo validator: Report generated, no critical failures between remediation and audit repos

#### Known Pre-Existing Issues (not addressed in this QA pass)

- 3 undefined chrony template variables (`ubtu22cis_time_synchronization_servers`, `ubtu22cis_chrony_server_options`, `ubtu22cis_chrony_user`)
- 1 dotted notation in `pam_unix.j2` (`ubtu22cis_rule_5.3.3.4.x` should use underscores)
- 27 manual warn count block-level vars (auto-fixable)
- 6 verify.yml register prefix warnings (cosmetic — `verify_` prefix instead of standard `discovered_`)

---

### Added
- Initial v3.0.0 CIS benchmark implementation (306 controls)
- New Section 4: Host Based Firewall (UFW) controls
- Ansible facts gathering, fetch option for apt cache
- APT lock_timeout option for package operations
- APT purge lockout capability (thanks to @tmeckel)
- Ability to change max-concurrent processes for audit
- Port 53 UDP to outbound firewall rules
- Firewall port variables and conditionals (4.1.4)
- Enhanced 7.1.12 filesystem type exclusion variable
- aarch64 support for pre-audit setup conditions
- Syscalls table for all architectures
- NIST 800-53 values to task tags
- issue_message as now required field
- Missing variable for issue #296 from public repo

### Changed
- Complete section renumbering for CIS v3.0.0 (Section 4 = Firewall, ~290 controls renumbered)
- Company name and date alignment across all files
- Separated 6.2.4.1/3 tasks into distinct files
- Moved default variables to vars/main rather than set_fact
- Updated service script
- Improved logic for 5.4.1.1, 5.4.2.5, log file permissions
- Updated ansible facts logic
- Aligned with coding standards (lint, FQCN, mode quoting)
- Updated pre-commit hooks (multiple autoupdates)
- Renamed register variables to isolate for tasks
- Updated copy loop logic
- Changed 6.3.2.1 to use path instead of dest in module

### Fixed
- Handler typos (thanks to @dderemiah)
- tmp mount handler logic (thanks to #304 @huntermccallum)
- 5.4.2.5 improved tests and conditionals (thanks to #303 @numericillustration)
- Fix for #280 (thanks to @omeravner)
- Issue #287 addressed
- Issue #270 addressed (thanks to @bgro)
- exec bits for 1.4.1 (thanks to @dderemiah)
- Typo in register value 5.3.3.3.2
- Quotes on mode for ansible facts and spacing
- Multiple typo fixes across task files
- Type fix for firewall_ports variable
- Arch name to match Ansible-provided arch
- Conflict resolution for multiple files (post_remediation_audit, section 5/6)

### Removed
- Legacy options cleaned up

### Security
- Updated permissions across role files
- 6.1.3 added conditional for log file access
- Added supported_syscalls variable for auditd

---

## Based on CIS v3.0.0 - Feb 2026

- 7.1.12 enhancement
- Company naming alignment
- Legacy options removed
- pre-commit update
- apt purge lockout variable and rule updates thanks to @tmeckel
- Fixed handler auditd rules reload referencing undefined variable (old v2.0.0 rule 4.1.3.21 naming)
- Fixed aidecheck.timer.j2 template variable references to match defaults (ubtu22cis_aide_cron dict to individual vars)
- Fixed variable name bug in prelim.yml: ubtu22_sshd_config_file corrected to ubtu22cis_sshd_config_file
- Fixed spelling: logiles, Noe, thier, maxx, dicover, foe, fate, choses, e.gf
- Fixed grammar: repeated words (to to, of of, the the), subject-verb disagreements (This are, This have), and typos (can must, Wait to do, and or)
- Fixed comment phrasing: hashed out, product so cannot, one to specify, Clients Services
- Fixed inconsistent comment in goss template (dovecot-pop3 corrected to cyrus-imap)
- Fixed multiple consecutive spaces in comments across defaults/main.yml, templates, and prelim.yml
- Corrected grub user password assertion message in tasks/main.yml

## Based on CIS v3.0.0 - Dec 2025

- pre-commit update
- 4.1.4 ufw updated to include ntp port and improved logic
- 6.2.4.1/2/3 tasks separated
- aide service script updated

## Based on CIS v3.0.0 - Oct 2025

- Numbering changed
- CCI added where required
- overlay kernel module added
- /tmp updated
- cis levels changed for partitions
- xwayland for gdm disabled
- ipv4 and ipv6 sysctl separated
- ssh config file options
- UFW Only firewall documented now rewritten - check ports allowed etc

## Based on CIS v2.0.0

### Oct 2025

- Readme and workflows updated

### Sept 2025

- 5.4.2.5 improved thanks to @numericillustration
- tmp handler logic improved thanks to @huntermccallum
- audit now had the ability to adjust concurrent processes
- pre-commit updates
- grub handler update perms thanks to @dderemiah
- fixed handler typos for systemd thanks to @dderemiah
- updated auditd template logic - thanks to @matt-j-griffin

### May 2025 QA Fixes

- Typo fixes

> **Note:** CIS v3.0.0 is a rewrite of approx 75% of controls including reordering, new sections, and controls in differing sections. Do not migrate from v2.0.0 — use a clean v3.0.0 base.

## Based on CIS V1.0.0

### 1.1.1

- Huge thanks to @rostskadat (#175 - SSH default variables) and @DianaMariaDDM (#200 - tmp mount options)

### 1.1.0

- #223 thanks to @txsastre
- Audit moved to run prior to changes, improvements to content methods
- lint and tidy up, ansible version update
- unused filesystem added to container skip list, unused vars removed

### 1.0.9

- Updated audit command for multiple groups
- #144 usb-blacklisting thanks to @paulquevedojdrf
- #152 and #170 SSH validate thanks to @dderemiah and @twadelij
- #180 and #181 password reuse thanks to @DianaMariaDDM
- #182 pwquality enhancement thanks to @ma3s7ro
- #184 container config thanks to @ipruteanu-sie
- #204 reboot idempotent fix thanks to @bhuddah

### 1.0.8

- Updated goss binary to 0.4.4, moved audit variables to vars/audit.yml
- New audit_only function, removed dupes in audit config

### 1.0.7

- Thanks to @loz for testing and feedback
- 1.7.1 dynamic check, 4.1.4.1/4.1.4.5 improved logic
- SSH defaults, bootloader password, audit updates
- sshd ciphers/macs/kex now lists, CIS level corrections
- Rule 5.4.2 logic improvements thanks to @Petri, @Loz, @bgro
- Issues: #131, #148, #123, #132, #135, #136, #138-#145, #146, #151, #153, #154, #158, #161, #164

### 1.0.6

- Collections links updated for galaxy-ng changes
- Issues: #120, #121, #124, #125, #126, #128 — thanks to @zac90, @ipruteanu-sie, @dderemiah

### 1.0.5

- Updated import_tasks to state file
- Issues: #79, #80, #81, #82 thanks to @bgro; PR #63 thanks to @andrejzverev

### 1.0.4

- Goss version updated, linting, pre-commit added
- Issues: #59, #61, #62, #64, #67, #69

### 1.0.3

- Issues: #53, #54, #55 thanks to @zac90; PR #50 thanks to @rspataru
- Workflow updates, lint file updates, readme tidy up

### 1.0.2

- Issues: #35-#45 thanks to @zac90
- Mount command improvements, section 5.4 tags, umask improvements

### 1.0.1

- Issues: #25 (@bgro), #27 (@FaisalAli92), #30, #31, #33 (@zac90), #32 (@twadelij)
- PR #29 thanks to @treyperonne
- Improvements to prelim checks (#13)

### 1.0 - Initial CIS v1.0.0 release

- Issues: #25, #27; PR #5
- Ansible 2.10.1 minimum, FQCNs, audit alignment
- Default firewall now UFW, sysctl/syslog options added

### 0.9 - April 2023

- Yamllint, ansible-lint, FQCN checks
- PRs: #21 thanks to @IdrisDose
- Issues: #13-#20 thanks to @vdmkenny, @bgro
