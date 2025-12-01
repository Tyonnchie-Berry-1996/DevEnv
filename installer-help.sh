#!/bin/bash

while read -r pkg; do
  # skip empty lines and comments
  [ -z "$pkg" ] && continue
  [[ "$pkg" =~ ^# ]] && continue

  echo "=== Installing $pkg ==="
  pip3 install "$pkg" || echo "FAILED: $pkg" >> failed_packages.log
done < requirements.txt

