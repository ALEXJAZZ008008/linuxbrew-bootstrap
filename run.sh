#!/bin/bash

echo -e $(hostname)
echo -e $(date)"\n"

/usr/bin/time -f 'Elapsed time: %es\nMemory usage: %M KB\nCPU usage: %P' ./download.sh | tee ./linuxbrew-bootstrap_download_log
/usr/bin/time -f 'Elapsed time: %es\nMemory usage: %M KB\nCPU usage: %P' ./install.sh $1 | tee ./linuxbrew-bootstrap_install_log

echo -e $(date)
