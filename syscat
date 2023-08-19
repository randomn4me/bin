#!/bin/sh

reset="\033[0m"

color() {
    printf "%s" "\033[3${1}m"
}

COLOR=1
pkeyval() {
    value=`echo $2 | tr '[:upper:]' '[:lower:]'`
    printf "\t$(color $COLOR)%6s$reset : %s\n" "$1" "$value"
    test $COLOR -eq 7 && COLOR=1 || COLOR=$(( COLOR + 1 ))
}

myuptime() {
    secs="`< /proc/uptime`"
    secs="${secs/.*}"

    days="$(( secs / 60 / 60 / 24 ))"
    hours="$(( secs / 60 / 60 % 24 ))"
    mins="$(( secs / 60 % 60 ))"

    printf "%dd %dh %dm" "$days" "$hours" "$mins"
}

kernel=`uname -r`
distro="$(grep -o '[a-zA-Z]*' <<< $kernel)"
shell=`echo ${SHELL##*/}`
packages=`pacman -Qq | wc -l`
birth=`head -n1 /var/log/pacman.log | sed "s/^\[\(.*\)T.*\].*/\1/p;d"`
uptime="`myuptime`"
wm=`tail -n1 $HOME/.xinitrc | cut -d' ' -f2`

printf "\n"
printf "\t$(color 3)%s$reset %s\n\n" "$USER" "is online"

pkeyval "distro" "$distro"
pkeyval "kernel" "$kernel"
pkeyval "shell" "$shell"
pkeyval "uptime" "$uptime"
printf "\n"

pkeyval "wm" $wm
printf "\n"

pkeyval "#pkgs" $packages
pkeyval "birth" $birth
printf "\n"

# borrowed by xero
COLOR=0
printf "   "
while [ $COLOR -le 6 ]
do
  printf "\e[$((COLOR+41))m\e[$((COLOR+30))m█▓▒░"
  COLOR=$(($COLOR+1))
done
printf "\e[37m█\e[0m▒░\n\n"
