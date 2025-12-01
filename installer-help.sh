#!/bin/bash

while read -r pkg; do
  # skip empty lines and comments
  [ -z "$pkg" ] && continue
  [[ "$pkg" =~ ^# ]] && continue

  echo "=== Installing $pkg ==="
  python3 -m pip install "$pkg" || echo "FAILED: $pkg" >> failed_packages.log
done < requirements.txt

