#!/bin/sh
set -eu

export DEBIAN_FRONTEND=noninteractive
attempt=0
until dpkg -i /inputs/debs/*.deb >/tmp/runtime-dpkg.log 2>&1; do
    attempt=$((attempt + 1))
    if [ "$attempt" -ge 5 ]; then
        cat /tmp/runtime-dpkg.log
        exit 1
    fi
done
rm -f /tmp/runtime-dpkg.log
rm -rf /var/lib/apt/lists/*

mkdir -p /opt/pypy3
tar -xzf /inputs/pypy3-linux64.tar.gz -C /opt/pypy3 --strip-components=1
rm -f /opt/pypy3/bin/python*
useradd -m judge
