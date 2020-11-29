#### What

Some experiments around Google's minijail.

https://android.googlesource.com/platform/external/minijail/+/refs/tags/linux-v16


#### Usage

Usage: Simply run `make` and then run the following commands:

```
docker run -it --rm --name app app
```

Inside the `app` container:

```
$ docker exec -it app bash
root@882a29a3ffa4:/# ps aux
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root           1  0.1  0.0   2596   736 pts/0    Ss+  15:38   0:00 /bin/sh -c /init.sh
root           6  0.0  0.0   3964  2828 pts/0    S+   15:38   0:00 /bin/bash /init.sh
root           7  0.0  0.0   3036  1964 pts/0    S    15:38   0:00 /minijail0 -u app-1 -g app-1 -- /app-1.sh
root           8  0.0  0.0   3036  2040 pts/0    S    15:38   0:00 /minijail0 -u app-2 -g app-2 -- /app-2.sh
root           9  0.0  0.0   2508   728 pts/0    S+   15:38   0:00 sleep 32
app-2         10  0.0  0.0   4208  3152 ?        Ss   15:38   0:00 /bin/bash /app-2.sh
app-1         11  0.0  0.0   4208  3068 ?        Ss   15:38   0:00 /bin/bash /app-1.sh
app-1         12  0.0  0.0   2508   728 ?        S    15:38   0:00 sleep 32
app-2         13  0.0  0.0   2508   660 ?        S    15:38   0:00 sleep 32
root          14  0.5  0.0   4096  3416 pts/1    Ss   15:38   0:00 bash
root          21  0.0  0.0   6752  3020 pts/1    R+   15:38   0:00 ps aux
```


#### More to come

- Use minijail to do more stuff - drop all caps, apply custom seccomp profile


#### References

- [Minijail: Sandboxing software running on Linux kernels](http://events17.linuxfoundation.org/sites/events/files/slides/Minijail-%20Sandboxing%20software%20running%20on%20Linux%20kernels.pdf)

- https://www.linux.com/news/minijail-googles-tool-safely-run-untrusted-programs/

- https://blog.cloudflare.com/sandboxing-in-linux-with-zero-lines-of-code/
