#!/bin/sh

trap Stop SIGTERM


Stop() {
  echo "Caught SIGTERM signal!"
  kill -TERM $$ 2>/dev/null
}

DONEFILE="/data/rotated.lst"

find /data -type f -iname '*jpg'|while read NAME; do
  HASH=$(echo $NAME|md5sum|cut -d ' ' -f1)

  if ! grep -q "^${HASH}$" "${DONEFILE}"; then
    renrot --no-rename "${NAME}" && echo "${HASH}" >> "${DONEFILE}"
  else
    echo "${NAME} is allready handled, skipping..."
  fi
done
