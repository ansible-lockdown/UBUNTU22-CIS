#! /usr/bin/env bash

# Based on original Script provided by CIS
# CVEs correct at time of creation - October2025

{
   a_check=() a_output=() a_module=() a_output2=() a_output3=()
   l_search="$(readlink -e /usr/lib/modules/ || readlink -e /lib/modules/)"
   IFS=$'\n' read -r -d '' -a a_mounted < <(findmnt -Dkerno fstype \
   | sort -u && printf '\0' )
   IFS=$'\n' read -r -d '' -a a_lsmod < <(lsmod | awk '{print $1}' && printf '\0' )
   IFS=$'\n' read -r -d '' -a a_showconfig < <(modprobe --showconfig | \
   grep -Pi -- '^\h*(blacklist|install)\h+' && printf '\0')
   while IFS= read -r -d $'\0' l_module_dir; do
      if [ ! "$(basename "$l_module_dir")" = "nls" ]; then
         while IFS= read -r -d $'\0' l_module_file; do
            l_mname="$(basename "$l_module_file" | cut -d'.' -f1)"
            if [ -f "$l_module_file" ] && ! grep -Psiq -- '\b'"$l_mname"'\b' <<< "${a_module[*]}"; then
               a_module+=("$l_mname")
            fi
         done < <(find -L "$l_module_dir" -mindepth 1 -maxdepth 1 -type f -print0)
      fi
   done < <(find "$l_search"/**/kernel/fs/ -mindepth 1 -maxdepth 1 -type d ! -empty -print0)
   for l_module in "${a_module[@]}"; do
      if grep -Psoiq -- '\b'"$l_module"'\b' <<< "${a_mounted[*]}"; then
         a_output+=("  - \"$l_module\"")
      elif grep -Psoiq -- '\b'"$l_module"'\b' <<< "${a_lsmod[*]}"; then
         a_output2+=("  - \"$l_module\"")
      elif ! grep -Psioq -- '\binstall\h+'"${l_module//-/_}"'\h+\H+\b' <<< "${a_showconfig[*]}" || \
      ! grep -Psioq -- '\bblacklist\h+'"${l_module//-/_}"'\b' <<< "${a_showconfig[*]}"; then
         a_output3+=("  - \"$l_module\"")
      fi
   done
   [ "${#a_output[@]}" -gt 0 ] && printf '%s\n' "" \
   "- There are \"${#a_output[@]}\" kernel modules currently mounted:" "${a_output[@]}"
   [ "${#a_output2[@]}" -gt 0 ] && printf '%s\n' "" \
   "- There are \"${#a_output2[@]}\" kernel modules currently loaded:" "${a_output2[@]}"
   [ "${#a_output3[@]}" -gt 0 ] && printf '%s\n' "" \
   "- There are \"${#a_output3[@]}\" Kernel modules currently loadable:" "${a_output3[@]}"
}
