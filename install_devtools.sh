#!/usr/bin/env bash

apt-get update
apt-get install -y --no-install-recommends man info git gdb gdbserver strace valgrind
apt-get build-dep -y fis-gtm
