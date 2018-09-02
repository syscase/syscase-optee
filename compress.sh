#!/usr/bin/env bash

BASE_PATH=$(dirname "$(readlink -f "$0")")

cd "$BASE_PATH/task/outputs"

while true; do
  tar --create --xz --remove-files --file "cov-$(date +"%F-%H%M%S").tar.xz" "*/coverage/*.*"
  sleep 10m
done
