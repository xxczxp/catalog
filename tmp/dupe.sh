#!/bin/bash

# 假设你的变量名为 VARIABLE，下面是它的赋值示例
VARIABLE="/etc/group
/etc/host.conf
/etc/hosts
/etc/ld.so.cache
/etc/localtime
/etc/mime.types
/etc/nsswitch.conf
/etc/passwd
/etc/resolv.conf5"

# 读取VARIABLE中的每一行
echo "$VARIABLE" | while read line; do
    # 对于每一行，重复两遍，中间以空格连接，并在前面加上 COPY --from=build
    echo "COPY --from=build ${line} ${line}"
done