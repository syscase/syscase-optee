#!/usr/bin/env bash

root=$(dirname "$(readlink -f "$0")")

function clean_syscase {
  cd "$root/optee_examples/agent/syscase"
  make clean
}

function make_afl {
  cd "$root/afl"
  make
}

function make_toolchains {
  cd "$root/build"
  make toolchains
}

function make_smcchar {
  cd "$root/optee_examples/agent/smcchar"
  ./build.sh
}

function make_optee {
  cd "$root/build"
  QEMU_VIRTFS_ENABLE=y QEMU_USERNET_ENABLE=y make
}

function make_smc_identifiers {
  cd "$root/smc_identifiers"
  make
}

make_afl
make_toolchains
make_optee
clean_syscase
make_smcchar
clean_syscase
make_optee
make_smc_identifiers
