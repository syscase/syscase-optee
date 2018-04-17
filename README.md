# Fuzzing OPTEE with Syscase

* Follow the instructions of `syscase-optee-manifest` to checkout all repos
* Follow the [OP-TEE Build Guide](https://github.com/OP-TEE/build#7-get-and-build-the-solution) to build OP-TEE.

## Arch Linux
Install AUR meta package [op-tee-tools](https://aur.archlinux.org/packages/op-tee-tools/) to install all OP-TEE dependencies. 

### Python 3 issue
`/usr/bin/python` defaults to `/usr/bin/python3` under Arch Linux not `/usr/bin/python2`, but OP-TEE expects `python2`.
You can fix this by creating `~/bin/python` (make sure `~/bin` is in your `PATH`):
```bash
#!/bin/bash
script=$(readlink -f -- "$1")
case "$script" in (/home/user/optee/*|/home/user/other_path/*)
    exec python2 "$@"
    ;;
esac

exec python3 "$@"
```

## Fuzzing

* Add task/config:

```bash
PANIC_ADDRESS=e10ea68
DMESG_ADDRESS=ffff00000810a7a0
```

* Start master:

```bash
$ screen -R afl-m
$ FUZZ_ID=00 ./start-master
```

* Detach and start screens:

```bash
$ ./log-00-normal.sh
$ ./log-00-secure.sh
$ screen -r normal-<UUID>
```

* Start fuzzing in normal world shell (e.g. SMC):

```bash
$ insmod /etc/smcchar.ko
$ optee_exampe_agent -S
```

* Detach and start secondary:

```bash
$ screen -R afl-s01
$ FUZZ_ID=01 ./start-secondary
```

* Detach and start screens:

```bash
$ ./log-01-normal.sh
$ ./log-01-secure.sh
$ screen -r normal-<UUID>
```

* Start fuzzing in normal world shell

* Start additional instances with unique `FUZZ_ID`
