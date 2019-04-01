#!/bin/bash

NR_CPUS=4
make package/symlinks
for a in $(ls -1 ./configs/*); do
	cp ${a} ./.config
	make defconfig
	make -j${NR_CPUS} tools/install
	make -j${NR_CPUS} toolchain/install
done
