FROM drupal:10.2.4 as build

# RUN /usr/bin/sed -i '/exec apache2 -DFOREGROUND "\$@"/d' /usr/local/bin/apache2-foreground
# RUN /usr/local/bin/apache2-foreground


FROM alpine:3 AS sys

RUN set -xe; \
    mkdir -p /target/etc; \
    mkdir -p /blank; \
    apk --no-cache add \
      ca-certificates \
      tzdata \
    ; \
    update-ca-certificates; \
    ln -sf ../usr/share/zoneinfo/Etc/UTC /target/etc/localtime; \
    echo "Etc/UTC" > /target/etc/timezone;

FROM scratch

COPY --from=sys /target/etc /etc
COPY --from=sys /usr/share/zoneinfo/Etc/UTC /usr/share/zoneinfo/Etc/UTC
COPY --from=sys /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt
COPY --from=sys /blank /tmp


# excutable files and supply
COPY --from=build /usr/sbin/apache2 /usr/sbin/apache2
COPY --from=build /run /run 


# set in init.sh now
# ENV APACHE_CONFDIR=/etc/apache2
# ENV APACHE_ENVVARS=${APACHE_CONFDIR}/envvars
# ENV APACHE_RUN_DIR=/var/run/apache2
# ENV APACHE_PID_FILE=${APACHE_RUN_DIR}/apache2.pid

# apache2 dependency libraries
COPY --from=build /lib/x86_64-linux-gnu/libapr-1.so.0 /lib/x86_64-linux-gnu/libapr-1.so.0
COPY --from=build /lib/x86_64-linux-gnu/libaprutil-1.so.0 /lib/x86_64-linux-gnu/libaprutil-1.so.0
COPY --from=build /lib/x86_64-linux-gnu/libargon2.so.1 /lib/x86_64-linux-gnu/libargon2.so.1
COPY --from=build /lib/x86_64-linux-gnu/libbrotlicommon.so.1 /lib/x86_64-linux-gnu/libbrotlicommon.so.1
COPY --from=build /lib/x86_64-linux-gnu/libbrotlidec.so.1 /lib/x86_64-linux-gnu/libbrotlidec.so.1
COPY --from=build /lib/x86_64-linux-gnu/libbz2.so.1.0 /lib/x86_64-linux-gnu/libbz2.so.1.0
COPY --from=build /lib/x86_64-linux-gnu/libc.so.6 /lib/x86_64-linux-gnu/libc.so.6
COPY --from=build /lib/x86_64-linux-gnu/libcom_err.so.2 /lib/x86_64-linux-gnu/libcom_err.so.2
COPY --from=build /lib/x86_64-linux-gnu/libcrypt.so.1 /lib/x86_64-linux-gnu/libcrypt.so.1
COPY --from=build /lib/x86_64-linux-gnu/libcrypto.so.3 /lib/x86_64-linux-gnu/libcrypto.so.3
COPY --from=build /lib/x86_64-linux-gnu/libcurl.so.4 /lib/x86_64-linux-gnu/libcurl.so.4
COPY --from=build /lib/x86_64-linux-gnu/libexpat.so.1 /lib/x86_64-linux-gnu/libexpat.so.1
COPY --from=build /lib/x86_64-linux-gnu/libffi.so.8 /lib/x86_64-linux-gnu/libffi.so.8
COPY --from=build /lib/x86_64-linux-gnu/libfreetype.so.6 /lib/x86_64-linux-gnu/libfreetype.so.6
COPY --from=build /lib/x86_64-linux-gnu/libgcc_s.so.1 /lib/x86_64-linux-gnu/libgcc_s.so.1
COPY --from=build /lib/x86_64-linux-gnu/libgmp.so.10 /lib/x86_64-linux-gnu/libgmp.so.10
COPY --from=build /lib/x86_64-linux-gnu/libgnutls.so.30 /lib/x86_64-linux-gnu/libgnutls.so.30
COPY --from=build /lib/x86_64-linux-gnu/libgssapi_krb5.so.2 /lib/x86_64-linux-gnu/libgssapi_krb5.so.2
COPY --from=build /lib/x86_64-linux-gnu/libhogweed.so.6 /lib/x86_64-linux-gnu/libhogweed.so.6
COPY --from=build /lib/x86_64-linux-gnu/libicudata.so.72 /lib/x86_64-linux-gnu/libicudata.so.72
COPY --from=build /lib/x86_64-linux-gnu/libicuuc.so.72 /lib/x86_64-linux-gnu/libicuuc.so.72
COPY --from=build /lib/x86_64-linux-gnu/libidn2.so.0 /lib/x86_64-linux-gnu/libidn2.so.0
COPY --from=build /lib/x86_64-linux-gnu/libjpeg.so.62 /lib/x86_64-linux-gnu/libjpeg.so.62
COPY --from=build /lib/x86_64-linux-gnu/libk5crypto.so.3 /lib/x86_64-linux-gnu/libk5crypto.so.3
COPY --from=build /lib/x86_64-linux-gnu/libkeyutils.so.1 /lib/x86_64-linux-gnu/libkeyutils.so.1
COPY --from=build /lib/x86_64-linux-gnu/libkrb5.so.3 /lib/x86_64-linux-gnu/libkrb5.so.3
COPY --from=build /lib/x86_64-linux-gnu/libkrb5support.so.0 /lib/x86_64-linux-gnu/libkrb5support.so.0
COPY --from=build /lib/x86_64-linux-gnu/liblber-2.5.so.0 /lib/x86_64-linux-gnu/liblber-2.5.so.0
COPY --from=build /lib/x86_64-linux-gnu/libldap-2.5.so.0 /lib/x86_64-linux-gnu/libldap-2.5.so.0
COPY --from=build /lib/x86_64-linux-gnu/liblzma.so.5 /lib/x86_64-linux-gnu/liblzma.so.5
COPY --from=build /lib/x86_64-linux-gnu/libm.so.6 /lib/x86_64-linux-gnu/libm.so.6
COPY --from=build /lib/x86_64-linux-gnu/libnettle.so.8 /lib/x86_64-linux-gnu/libnettle.so.8
COPY --from=build /lib/x86_64-linux-gnu/libnghttp2.so.14 /lib/x86_64-linux-gnu/libnghttp2.so.14
COPY --from=build /lib/x86_64-linux-gnu/libonig.so.5 /lib/x86_64-linux-gnu/libonig.so.5
COPY --from=build /lib/x86_64-linux-gnu/libp11-kit.so.0 /lib/x86_64-linux-gnu/libp11-kit.so.0
COPY --from=build /lib/x86_64-linux-gnu/libpcre2-8.so.0 /lib/x86_64-linux-gnu/libpcre2-8.so.0
COPY --from=build /lib/x86_64-linux-gnu/libpng16.so.16 /lib/x86_64-linux-gnu/libpng16.so.16
COPY --from=build /lib/x86_64-linux-gnu/libpsl.so.5 /lib/x86_64-linux-gnu/libpsl.so.5
COPY --from=build /lib/x86_64-linux-gnu/libpthread.so.0 /lib/x86_64-linux-gnu/libpthread.so.0
COPY --from=build /lib/x86_64-linux-gnu/libreadline.so.8 /lib/x86_64-linux-gnu/libreadline.so.8
COPY --from=build /lib/x86_64-linux-gnu/libresolv.so.2 /lib/x86_64-linux-gnu/libresolv.so.2
COPY --from=build /lib/x86_64-linux-gnu/librtmp.so.1 /lib/x86_64-linux-gnu/librtmp.so.1
COPY --from=build /lib/x86_64-linux-gnu/libsasl2.so.2 /lib/x86_64-linux-gnu/libsasl2.so.2
COPY --from=build /lib/x86_64-linux-gnu/libsodium.so.23 /lib/x86_64-linux-gnu/libsodium.so.23
COPY --from=build /lib/x86_64-linux-gnu/libsqlite3.so.0 /lib/x86_64-linux-gnu/libsqlite3.so.0
COPY --from=build /lib/x86_64-linux-gnu/libssh2.so.1 /lib/x86_64-linux-gnu/libssh2.so.1
COPY --from=build /lib/x86_64-linux-gnu/libssl.so.3 /lib/x86_64-linux-gnu/libssl.so.3
COPY --from=build /lib/x86_64-linux-gnu/libstdc++.so.6 /lib/x86_64-linux-gnu/libstdc++.so.6
COPY --from=build /lib/x86_64-linux-gnu/libtasn1.so.6 /lib/x86_64-linux-gnu/libtasn1.so.6
COPY --from=build /lib/x86_64-linux-gnu/libtinfo.so.6 /lib/x86_64-linux-gnu/libtinfo.so.6
COPY --from=build /lib/x86_64-linux-gnu/libunistring.so.2 /lib/x86_64-linux-gnu/libunistring.so.2
COPY --from=build /lib/x86_64-linux-gnu/libuuid.so.1 /lib/x86_64-linux-gnu/libuuid.so.1
COPY --from=build /lib/x86_64-linux-gnu/libwebp.so.7 /lib/x86_64-linux-gnu/libwebp.so.7
COPY --from=build /lib/x86_64-linux-gnu/libxml2.so.2 /lib/x86_64-linux-gnu/libxml2.so.2
COPY --from=build /lib/x86_64-linux-gnu/libz.so.1 /lib/x86_64-linux-gnu/libz.so.1
COPY --from=build /lib/x86_64-linux-gnu/libzip.so.4 /lib/x86_64-linux-gnu/libzip.so.4
COPY --from=build /lib/x86_64-linux-gnu/libzstd.so.1 /lib/x86_64-linux-gnu/libzstd.so.1

#second library
COPY --from=build /usr/lib/x86_64-linux-gnu/gconv/gconv-modules.cache /usr/lib/x86_64-linux-gnu/gconv/gconv-modules.cache
COPY --from=build /usr/lib/x86_64-linux-gnu/libpq.so.5 /usr/lib/x86_64-linux-gnu/libpq.so.5


# for apache
COPY --from=build  /etc/apache2/ /etc/apache2/
COPY --from=build /usr/lib/apache2/ /usr/lib/apache2/

#other things
# COPY --from=build /usr/lib/locale/C.UTF-8/LC_CTYPE /usr/lib/locale/C.UTF-8/LC_CTYPE
# COPY --from=build /usr/lib/locale/C.utf8/LC_CTYPE /usr/lib/locale/C.utf8/LC_CTYPE
# COPY --from=build /usr/lib/locale/locale-archive /usr/lib/locale/locale-archive
# COPY --from=build /usr/lib/ssl/openssl.cnf /usr/lib/ssl/openssl.cnf

#for user and group
COPY --from=build /etc/group /etc/group
COPY --from=build /etc/host.conf /etc/host.conf
# COPY --from=build /etc/hosts /etc/hosts
COPY --from=build /etc/ld.so.cache /etc/ld.so.cache
COPY --from=build /etc/localtime /etc/localtime
COPY --from=build /etc/mime.types /etc/mime.types
COPY --from=build /etc/nsswitch.conf /etc/nsswitch.conf
COPY --from=build /etc/passwd /etc/passwd
# COPY --from=build /etc/resolv.conf5 /etc/resolv.conf5


#for php
COPY --from=build /usr/local/lib/php/ /usr/local/lib/php/

# extra from ldd
COPY --from=build /lib64/ld-linux-x86-64.so.2 /lib64/ld-linux-x86-64.so.2
COPY --from=build /lib/x86_64-linux-gnu/libselinux.so.1 /lib/x86_64-linux-gnu/libselinux.so.1

# for DocumentRoot
COPY --from=build /var/www/ /var/www/


# sh and the sh entry
COPY --from=build /bin/bash /bin/bash
COPY ./scripts/init.sh /init.sh

#mkdir and dirname support init.sh
COPY --from=build /usr/bin/mkdir /usr/bin/mkdir
    #this is for mkdir
COPY --from=build /lib/x86_64-linux-gnu/libtinfo.so.6 /lib/x86_64-linux-gnu/libtinfo.so.6 
COPY --from=build /usr/bin/dirname /usr/bin/dirname

