#!/bin/bash

echo "hey - init.sh here"

# https://android.googlesource.com/platform/external/minijail/+/refs/tags/linux-v16
/minijail0 -u app-1 -g app-1 -- /app-1.sh &
/minijail0 -u app-2 -g app-2 -- /app-2.sh &

while true; do
	sleep 32
done
