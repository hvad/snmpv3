# Run docker snmpv3
docker run -p 161:161/udp --name test02 -d snmpv3 

# Test snmpv3
snmpwalk -v 3 -u snmp_user -A 'snmp_password' -x AES -X 'snmp_privpass' -l authPriv 127.0.0.1 
