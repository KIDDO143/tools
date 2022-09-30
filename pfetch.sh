#!/bin/sh

#user is already defined
host="main"
os="Ash Linux"
kernel="Linux 5.9.16-1"
uptime="$(uptime -p | sed 's/up //' | sed 's/ hours, /:/g' | sed 's/ minutes/ H:M/g')"
packages="$(pacman -Q | wc -l)"
shell="BASH"
uitype="WM"
ui="I3 WM"

## DEFINE COLORS
# probably don't change these
if [ -x "$(command -v tput)" ]; then
	bold="$(tput bold)"
	black="$(tput setaf 0)"
	red="$(tput setaf 1)"
	green="$(tput setaf 2)"
	yellow="$(tput setaf 3)"
	blue="$(tput setaf 4)"
	magenta="$(tput setaf 5)"
	cyan="$(tput setaf 6)"
	white="$(tput setaf 7)"
	reset="$(tput sgr0)"
fi

# you can change these
lc="${reset}${bold}${yellow}"       # labels
nc="${reset}${bold}${yellow}"       # user and hostname
ic="${reset}"                       # info
c0="${reset}${yellow}"              # first color
c1="${reset}${white}"               # second color

## OUTPUT
cat <<EOF

${c0}       _____      ${nc}${USER}${ic}@${nc}${host}${reset}
${c0}     \-     -/    ${lc}OS:     ${ic}${os}${reset}
${c0}  \_/         \   ${lc}KERNEL: ${ic}${kernel}${reset}
${c0}  |        ${c1}O O ${c0}|  ${lc}UPTIME: ${ic}${uptime}${reset}
${c0}  |_  ${c2}<   ${c0})  ${c2}3 ${c0})  ${lc}PACK:   ${ic}${packages}${reset}
${c0}  / \         /   ${lc}SHELL:  ${ic}${shell}${reset}
${c0}     /-_____-\    ${lc}${uitype}:     ${ic}${ui}${reset}

EOF
