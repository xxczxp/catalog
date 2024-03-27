## now has two problem

### docker run -p 8081:80 min-drupal /bin/bash /init.sh
outpute :
```
/bin/bash /init.sh
AH00112: Warning: DocumentRoot [/var/www/html] does not exist
AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 172.17.0.5. Set the 'ServerName' directive globally to suppress this message
```

and when accessing through web client, it show
```
Forbidden

You don't have permission to access this resource.
Apache/2.4.57 (Debian) Server at localhost Port 8081
```


### run with kraft

output
```
 D  qemu-system-x86_64 -append /bin/bash /init.sh  -cpu host,+x2apic,-pmu -daemonize -device virtio-net-pci,mac=02:b0:b0:1c:36:01,netdev=hostnet0 -device pvpanic -device sga -display none -enable-kvm -kernel /home/pneg/Document/catalog/library/drupal/10.2.4/.unikraft/build/drupal_qemu-x86_64 -machine pc,accel=kvm -m size=976M -monitor unix:/home/pneg/.local/share/kraftkit/runtime/079c32a8-b19e-4c6e-be72-4baa5d5f707b/qemu_mon.sock,server,nowait -name 079c32a8-b19e-4c6e-be72-4baa5d5f707b -netdev user,id=hostnet0,hostfwd=tcp::8082-:80 -nographic -no-reboot -S -parallel none -pidfile /home/pneg/.local/share/kraftkit/runtime/079c32a8-b19e-4c6e-be72-4baa5d5f707b/machine.pid -qmp unix:/home/pneg/.local/share/kraftkit/runtime/079c32a8-b19e-4c6e-be72-4baa5d5f707b/qemu_control.sock,server,nowait -qmp unix:/home/pneg/.local/share/kraftkit/runtime/079c32a8-b19e-4c6e-be72-4baa5d5f707b/qemu_events.sock,server,nowait -rtc base=utc -serial file:/home/pneg/.local/share/kraftkit/runtime/079c32a8-b19e-4c6e-be72-4baa5d5f707b/machine.log -smp cpus=1,threads=1,sockets=1 -vga none
en1: Interface is up
Powered by Unikraft Telesto (0.16.3~62751d5)
[    0.195844] ERR:  [libposix_process] Unsupported resource 6
/init.sh: fork: Operation not supported
en1: Set IPv4 address 10.0.2.15 mask 255.255.255.0 gw 10.0.2.2
``` 
