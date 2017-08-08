# Docker build for SAP MaxDB

## How to use?

* Fetch MaxDB installer files (download via SAP SDN)
* install MaxDB locally: `./SDBINST -global_prog /opt/maxdb/sdb/globalprograms -global_data /opt/maxdb/sdb/globaldata -o root -g root -i MaxDB -path /opt/maxdb/MaxDB -description "maxdb install" -network_port 7200`
* Clone this project (as root)
* copy or move `/opt/maxdb` to project folder (keep full path hierarchy including opt/)
* copy or move `/etc/opt/sdb` to project folder (also, keep full path hierarchy)
* copy or move `/var/lib/sdb` to project folder
* (optional) tweak db.ini and db.sh if you want to override default passwords or any of the configuration parameters used to create maxdb instance
* in this folder, run `docker build . -t local/maxdb`
* test run: `docker run -it --rm -p 7200:7200 -p 7210:7210 local/maxdb:latest` => this should print a load of output of MaxDB creating and starting an empty database instance (interactive run, quits and removes container with CTRL+C)
* "productive" local run: `docker run --name maxdb -d -p 7200:7200 -p 7210:7210 local/maxdb:latest` => you can watch the startup using `docker logs -f maxdb` to see things work well.
* connect using JDBC: `jdbc:sapdb://localhost/TESTDB`


## Caveats and TODOs

* Currently user and group are forced to be root inside the container to ease owner and permission mappings of system files a bit; MaxDB seems to be pretty strict here. This should be changed to sdb/sdba.
* So far this is mostly useless as the database created this way is empty. We need to find a way to fill in meaningful test data.

