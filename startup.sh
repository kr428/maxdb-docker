#!/bin/sh

x_server start
./db.sh
tail -f /opt/maxdb/sdb/globaldata/wrk/TESTDB/KnlMsgArchive
