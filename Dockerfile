FROM ubuntu:latest
ADD /opt /opt
ADD /etc/opt/sdb /etc/opt/sdb
ADD /var/lib /var/lib
ADD  startup.sh db.sh db.ini ./
ENV PATH=/opt/maxdb/sdb/globalprograms/bin:$PATH
EXPOSE 7200
EXPOSE 7210
CMD sh startup.sh
