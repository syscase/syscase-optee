#!/usr/bin/env bash

# ncwait PORT
function ncwait {
  while ! ncat --telnet 127.0.0.1 $1; do sleep 1; done
}

# ncwait_log PORT LOGFILE
function ncwait_log {
  ncwait $1 | tee -a "$2"
}

# ncwait_log_gz PORT LOGFILE
function ncwait_log_gz {
  ncwait $1 | tee -a >(gzip --stdout >> "$2")
}
