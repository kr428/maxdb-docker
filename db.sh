#!/bin/sh
dbmcli db_create TESTDB DBM,DBM
dbmcli -d TESTDB -u DBM,DBM -i db.ini
