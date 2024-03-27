

restart:
	@docker container rm -f some-drupal
	# @docker run --name mariadbtest1 -v .:/peng -e MARIADB_ROOT_PASSWORD=1 -p 3306:3306 -it mariadb:strace /bin/bash 
	@docker run --name some-drupal -v .:/peng -p 8080:80 -it drupal:10.2.4 /bin/bash



# strace -o /peng/starce_entrypoint.log bash /usr/local/bin/docker-entrypoint.sh mariadbd 

# "Cmd": [
#                 "apache2-foreground"
#             ],

#apache2-foreground: /usr/local/bin/apache2-foreground


# bash dupe.sh > dupeout
# cat drupal_openat.log | grep 'openat(AT_FDCWD' | awk -F'"' '{print $2}' | sort | uniq > fileneed.log