#!/bin/bash
#
# vim: tabstop=4

NR_CPUS=4
THE_CONFIG=./.config
#MY_PKGS='simpleproxy chrpath nmon tiv tshark'
#MY_PKGS='simpleproxy chrpath extundelete nmon tiv '
MY_PKGS='simpleproxy chrpath nmon tiv '

for a in $(ls -1 ./configs/*); do
	cp ${a} ${THE_CONFIG}
	make defconfig
	# MY_PKGS: 'package1\|package2'
	sed -ie "s/^#.*\(CONFIG_PACKAGE_\)\(${MY_PKGS// /\\\|}\) is.*$/\1\2=m/" ${THE_CONFIG}
	# grep -P "simpleproxy|chrpath" ${THE_CONFIG}
	# MY_PKGS: 'package1,package2'
	#make package/{${MY_PKGS/ /,}}/{clean,compile} V=s -j${NR_CPUS}
	for p in $MY_PKGS; do make package/$p/{clean,compile} V=s -j${NR_CPUS}; done
	make package/index V=s -j${NR_CPUS}
done
