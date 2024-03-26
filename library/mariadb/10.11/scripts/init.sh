source /usr/local/bin/docker-entrypoint.sh

_init() {

        MYSQL_ROOT_PASSWORD=mypass
        # if command starts with an option, prepend mariadbd
        if [ "${1:0:1}" = '-' ]; then
                set -- mariadbd "$@"
        fi

        #ENDOFSUBSTITUTIONS
        # skip setup if they aren't running mysqld or want an option that stops mysqld
        if [ "$1" = 'mariadbd' ] || [ "$1" = 'mysqld' ] && ! _mysql_want_help "$@"; then
                mysql_note "Entrypoint script for MariaDB Server ${MARIADB_VERSION} started."

                mysql_check_config "$@"
                # Load various environment variables
                docker_setup_env "$@"
                docker_create_db_directories

                # If container is started as root user, restart as dedicated mysql user
                # if [ "$(id -u)" = "0" ]; then
                #         mysql_note "Switching to dedicated user 'mysql'"
                #         exec gosu mysql "${BASH_SOURCE[0]}" "$@"
                # fi

                # there's no database, so it needs to be initialized
                if [ -z "$DATABASE_ALREADY_EXISTS" ]; then
                        docker_verify_minimum_env

                        docker_mariadb_init "$@"
                # MDEV-27636 mariadb_upgrade --check-if-upgrade-is-needed cannot be run offline
                #elif mariadb-upgrade --check-if-upgrade-is-needed; then
                elif _check_if_upgrade_is_needed; then
                        docker_mariadb_upgrade "$@"
                fi
        fi
        cp -R /var/lib/mysql /mysql
        # exec "$@"
}

echo "????"
_init "mariadbd" --user=root