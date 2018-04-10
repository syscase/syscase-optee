#!/usr/bin/env bash

root=$(dirname "$(readlink -f "$0")")

function make_run_optee {
  cd "$root/build"
  QEMU_VIRTFS_ENABLE=y QEMU_USERNET_ENABLE=y make
}

make_run_optee
