#!/bin/bash
# http://dev.mysql.com/doc/refman/5.0/en/resetting-permissions.html#resetting-permissions-unix

set -xeu

[ $(/usr/bin/whoami) = 'root' ] || {
    /bin/echo root only
    exit 1
}

init_file=/tmp/mysql-init

/bin/cat <<EOF > ${init_file}
-- Set the root password. root No Password
UPDATE mysql.user SET Password=PASSWORD('') WHERE User='root';
FLUSH PRIVILEGES;
-- Remove anonymous users
DELETE FROM mysql.user WHERE User='';
-- Disallow remote root login
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost',  '127.0.0.1',  '::1');
-- Remove test database
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
-- Reload privilege tables
FLUSH PRIVILEGES;
EOF
chmod 600 ${init_file}

nohup /bin/sh /usr/bin/mysqld_safe \
    --datadir=/var/lib/mysql \
    --socket=/var/lib/mysql/mysql.sock \
    --pid-file=/var/run/mysqld/mysqld.pid \
    --basedir=/usr \
    --user=mysql \
    --skip-grant-tables \
    --skip-networking &

while :
do
    [ -r /var/run/mysqld/mysqld.pid ] || continue

    if ps -ef | grep -q $(cat /var/run/mysqld/mysqld.pid) ; then
        break
    fi
    sleep 10
done

mysql -uroot < ${init_file} # 実際の処理では--login-pathを指定してrootでログイン、実行としている。

/etc/init.d/mysqld stop

rm -f ${init_file}

exit
