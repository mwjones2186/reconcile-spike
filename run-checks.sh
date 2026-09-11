#!/bin/sh
# The PR's own "checks". Executed by the untrusted `execute` workflow only.
# A PR makes this fail by adding the line FAIL to src/status.txt.
if grep -qx FAIL src/status.txt; then
  echo "checks: FAIL"
  exit 1
fi
echo "checks: pass"
