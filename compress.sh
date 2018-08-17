#!/usr/bin/env bash

BASE_PATH=$(dirname "$(readlink -f "$0")")

cd "$BASE_PATH/task/outputs"

while true; do
  7z a -t7z -m0=lzma2 -mx=9 -md128m -mfb=256 -sdel "cov-$(date +"%F-%H%M%S").7z" "*/coverage/*.*"
  sleep 10m
done
