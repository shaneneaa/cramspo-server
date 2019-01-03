echo DROP DATABASE IF EXISTS db_cramspot; > deleteDatabase.bat
echo CREATE DATABASE db_cramspot; > createDatabase.bat
mysql -h localhost -u root < deleteDatabase.bat
mysql -h localhost -u root < createDatabase.bat
mysql -h localhost -u root db_cramspot < ../database/db_cramspot.sql
del deleteDatabase.bat
del createDatabase.bat