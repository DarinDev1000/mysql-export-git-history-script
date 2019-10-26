#!/bin/bash
GIT_MYSQL=./schema
DATABASE_NAME=<database-name>
for T in `mysql -u <username> -p<password> -N -B -e 'show tables from <database-name>'`;
do
    echo "Backing up $T"
#    mysqldump --skip-comments --compact -u <username> -p<password> <database-name> $T > $GIT_MYSQL/$T.sql
    mysqldump --skip-comments --no-data --skip-add-drop-table -u <username> -p<password> <database-name> $T | sed 's/ AUTO_INCREMENT=[0-9]*//g' > $GIT_MYSQL/tables/$T.sql
done;

mysqldump --no-data --skip-add-drop-table -u <username> -p<password> <database-name> | sed 's/ AUTO_INCREMENT=[0-9]*//g' > $GIT_MYSQL/<database-name>_schema-all-tables.sql
