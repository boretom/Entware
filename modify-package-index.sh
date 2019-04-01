#!/bin/bash -x
#
# vim: tabstop=4

#MY_PKGS='simpleproxy chrpath nmon tiv tshark'
#MY_PKGS='simpleproxy chrpath extundelete nmon tiv '
MY_PKGS='simpleproxy chrpath nmon tiv'

for a in $(ls -1 ./configs/); do
	PKG_DIR="./bin/targets/${a%%.config}/generic-glibc/packages"
	for p in Packages{,.manifest}; do
		#awk -v pkg=$MY_PKGS BEGIN {found=0} /(nmon|simpleproxy|tiv|chrpath)/ 
		#awk -v pkgs="${MY_PKGS// /\\\|}" 
		awk -v pkgs="${MY_PKGS// /\|}" 'BEGIN {found=0} 
			$0 ~ pkgs { found=1 } 
			{ if(found == 1) print $0 } 
			/^$/ { found=0 }' ${PKG_DIR}/$p > ${PKG_DIR}/tmp.${p}
	done
	rm ${PKG_DIR}/Packages{,.manifest,.gz}
	mv ${PKG_DIR}/tmp.Packages ${PKG_DIR}/Packages
	gzip -k ${PKG_DIR}/Packages
	mv ${PKG_DIR}/tmp.Packages.manifest ${PKG_DIR}/Packages.manifest
	find ${PKG_DIR} -regex ".*\(${MY_PKGS// /\\\|}\|Packages\).*" -prune -o -exec rm {} \;

done
