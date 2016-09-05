#!/bin/bash

#install Payara Server 163 Full
cd /opt/java
wget -O payara.zip "http://info.payara.fish/cs/c/?cta_guid=de4a19f2-46e5-4f92-88ae-36300d4edcc2&placement_guid=6c4914a9-26de-4da5-b0fe-cd9f01ed1bea&portal_id=334594&redirect_url=APefjpF-lHo1tRDD9FmIH188GJoXoiCqNVdUqXHb-mysPzwSepjABaa4Dy8WnLi4kiRO5SN-QpJu64KgKcqj53lbSLix7PYm3xdxAQ6cn5kurq0T2sD5RXTHivhXWbeq7vcjghHigIw2y2cgaQK-hhVn4aSXe0Q_Oh_Jh6_K3EwnvhgVPqjE8xisfrReWzKzVWPR7oUMUdioqtixqNA1jleOqu0UtgQC7AyoLfLb-B1wr9Yqr7y4no1I8zXVa9Uc0y7rpqRYB8MZ&hsutk=518c7b1716c787f2a1d023ff2febb85b&utm_referrer=http%3A%2F%2Fwww.payara.fish%2Fdownloads&canon=http%3A%2F%2Fwww.payara.fish%2Fdownloads&__hstc=229474563.518c7b1716c787f2a1d023ff2febb85b.1473091244403.1473091244403.1473091244403.1&__hssc=229474563.2.1473091244404&__hsfp=3521686543"
unzip payara.zip
cd /opt/java/payara41/bin
./asadmin start-domain
./asadmin change-admin-password
./asadmin start-domain
./asadmin enable-secure-admin --port 4848
./asadmin restart-domain
