# L'image source Fedora
FROM fedora:latest

MAINTAINER David Hannequin
# Installation de l'agent SNMP
RUN dnf update -y && dnf install -y net-snmp net-snmp-utils && dnf clean all
# Fichier de configuration de l'agent SNMP
COPY snmpd.conf /etc/snmp/snmpd.conf
# Create SNMPv3 user and password
RUN net-snmp-create-v3-user -ro -a 'snmp_password' -x 'snmp_privpass' -X AES snmp_user 
# Démarrage de l'agent SNMP
CMD ["/usr/sbin/snmpd", "-f", "-c /etc/snnmp/snmpd.conf"]
# Ouverture du port udp/161
EXPOSE 161:161/udp
