#!/bin/bash
#name: 2_install_payara_micro.sh
wget -O payara-micro.jar "http://info.payara.fish/cs/c/?cta_guid=21e00628-5d9e-400a-9805-1fc99fe0de87&placement_guid=0c1037e0-adaf-4401-b888-05088602db6a&portal_id=334594&redirect_url=APefjpFHOAJo54xoLnGAl3QdIgeXS1esQdsRNAOg87eNyddHpd8BawxDGU_3H98NAnuz90phC5wK9PJ3Ha6mBvFiDuSZnSeN865RryT_0CRexfSObE_wqrnMgJn9zBrC1-j-Ns9GQO6TCTQi_CMpA7_ykryrFzAlW0-gyKgbqtKZFH21ASBKdYrJK8kbT_4W2pZOicXUCG-5rLYLhUTL1xj4CzA35EIJXw&hsutk=4418e7558469f3e158eb2fa36fb9229d&utm_referrer=http%3A%2F%2Fwww.payara.fish%2Fdownloads&canon=http%3A%2F%2Fwww.payara.fish%2Fdownloads&__hstc=229474563.4418e7558469f3e158eb2fa36fb9229d.1469635012377.1470053366971.1470165557418.4&__hssc=229474563.1.1470165557418&__hsfp=3923443337"
mv payara-micro.jar /opt/java
