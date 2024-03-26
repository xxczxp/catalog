FROM mariadb:10.11 AS build

# SHELL [ "bash" ]

COPY ./scripts/init.sh /init.sh
RUN chmod 777 /init.sh
RUN bash /init.sh 
RUN mkdir /empty

FROM scratch

# mariadb binaries, modules, configuration, log and runtime files
COPY --from=build /usr/local/bin/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
COPY --from=build /usr/sbin/mariadbd /usr/sbin/mariadbd
# COPY --from=build /var/lib/mysql/ /var/lib/mysql/
COPY --from=build /mysql /var/lib/mysql/
COPY --from=build /empty /tmp
COPY --from=build /empty /run/mysqld

# COPY --from=build /usr/bin/date /usr/bin/date
# COPY --from=build /usr/bin/awk /usr/bin/awk

# # awk Libraries
# COPY --from=build /lib/x86_64-linux-gnu/libsigsegv.so.2 /lib/x86_64-linux-gnu/libsigsegv.so.2
# COPY --from=build 

# Libraries
COPY --from=build /lib/x86_64-linux-gnu/libtinfo.so.6 /lib/x86_64-linux-gnu/libtinfo.so.6
COPY --from=build /lib/x86_64-linux-gnu/libc.so.6 /lib/x86_64-linux-gnu/libc.so.6
COPY --from=build /lib/x86_64-linux-gnu/libpcre2-8.so.0 /lib/x86_64-linux-gnu/libpcre2-8.so.0
COPY --from=build /lib/x86_64-linux-gnu/libcrypt.so.1 /lib/x86_64-linux-gnu/libcrypt.so.1
COPY --from=build /lib/x86_64-linux-gnu/liburing.so.2 /lib/x86_64-linux-gnu/liburing.so.2
COPY --from=build /lib/x86_64-linux-gnu/libpmem.so.1 /lib/x86_64-linux-gnu/libpmem.so.1
COPY --from=build /lib/x86_64-linux-gnu/libsystemd.so.0 /lib/x86_64-linux-gnu/libsystemd.so.0
COPY --from=build /lib/x86_64-linux-gnu/libz.so.1 /lib/x86_64-linux-gnu/libz.so.1
COPY --from=build /lib/x86_64-linux-gnu/libssl.so.3 /lib/x86_64-linux-gnu/libssl.so.3
COPY --from=build /lib/x86_64-linux-gnu/libcrypto.so.3 /lib/x86_64-linux-gnu/libcrypto.so.3
COPY --from=build /lib/x86_64-linux-gnu/libstdc++.so.6 /lib/x86_64-linux-gnu/libstdc++.so.6
COPY --from=build /lib/x86_64-linux-gnu/libm.so.6 /lib/x86_64-linux-gnu/libm.so.6
COPY --from=build /lib/x86_64-linux-gnu/libndctl.so.6 /lib/x86_64-linux-gnu/libndctl.so.6
COPY --from=build /lib/x86_64-linux-gnu/libdaxctl.so.1 /lib/x86_64-linux-gnu/libdaxctl.so.1
COPY --from=build /lib/x86_64-linux-gnu/liblzma.so.5 /lib/x86_64-linux-gnu/liblzma.so.5
COPY --from=build /lib/x86_64-linux-gnu/libzstd.so.1 /lib/x86_64-linux-gnu/libzstd.so.1
COPY --from=build /lib/x86_64-linux-gnu/liblz4.so.1 /lib/x86_64-linux-gnu/liblz4.so.1
COPY --from=build /lib/x86_64-linux-gnu/libcap.so.2 /lib/x86_64-linux-gnu/libcap.so.2
COPY --from=build /lib/x86_64-linux-gnu/libgcrypt.so.20 /lib/x86_64-linux-gnu/libgcrypt.so.20
COPY --from=build /lib/x86_64-linux-gnu/libgcc_s.so.1 /lib/x86_64-linux-gnu/libgcc_s.so.1
COPY --from=build /lib/x86_64-linux-gnu/libudev.so.1 /lib/x86_64-linux-gnu/libudev.so.1
COPY --from=build /lib/x86_64-linux-gnu/libuuid.so.1 /lib/x86_64-linux-gnu/libuuid.so.1
COPY --from=build /lib/x86_64-linux-gnu/libkmod.so.2 /lib/x86_64-linux-gnu/libkmod.so.2
COPY --from=build /lib/x86_64-linux-gnu/libgpg-error.so.0 /lib/x86_64-linux-gnu/libgpg-error.so.0
COPY --from=build /lib64/ld-linux-x86-64.so.2 /lib64/ld-linux-x86-64.so.2 

COPY --from=build /lib/x86_64-linux-gnu/libc.so.6 /lib/x86_64-linux-gnu/libc.so.6
COPY --from=build /lib64/ld-linux-x86-64.so.2 /lib64/ld-linux-x86-64.so.2

COPY --from=build  /bin/sh /bin/sh
COPY --from=build  /bin/bash /bin/bash

# ENTRYPOINT [ "/usr/sbin/mariadbd" ]
