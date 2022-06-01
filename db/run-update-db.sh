#!/bin/bash
HOST=35.189.145.225
USER=dev-wonqol-pj
DB_NAME=dev_wonqol_pj_wp
echo "Exporting...."
echo $'\n'
echo "***********************************"
echo "**  HOST=35.189.145.225          **"
echo "**  USER=dev-wonqol-pj           **"
echo "**  DB_NAME=dev_wonqol_pj_wp     **"
echo "***********************************"
echo $'\n'
echo "mysqldump -h ${HOST} -u${USER} -p ${DB_NAME} > ${DB_NAME}.sql"
mysqldump -h $HOST -u$USER -p $DB_NAME > $DB_NAME.sql

echo $'\n'
echo "Change URL..."
sed -i 's/35.221.122.169/localhost:888/g' $DB_NAME.sql
sed -i 's/35.243.83.47/localhost:4200/g' $DB_NAME.sql

sed -i '/GTID_PURGED/d' $DB_NAME.sql

echo "mysql -h 0.0.0.0 --port=33061  -uroot -proot cainz_wp < ${DB_NAME}.sql"
echo "Importing....";
mysql -uroot -proot cainz_wp < $DB_NAME.sql
rm -rf $DB_NAME.sql
echo "Import success!"