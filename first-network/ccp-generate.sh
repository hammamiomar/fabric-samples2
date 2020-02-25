#!/bin/bash

function one_line_pem {
    echo "`awk 'NF {sub(/\\n/, ""); printf "%s\\\\\\\n",$0;}' $1`"
}

function json_ccp {
    local PP=$(one_line_pem $5)
    local CP=$(one_line_pem $6)
    sed -e "s/\${ORG}/$1/" \
        -e "s/\${P0PORT}/$2/" \
        -e "s/\${P1PORT}/$3/" \
        -e "s/\${P2PORT}/$4/" \
        -e "s/\${P3PORT}/$5/" \
        -e "s/\${P4PORT}/$6/" \
        -e "s/\${P5PORT}/$7/" \
        -e "s/\${P6PORT}/$8/" \
        -e "s/\${P7PORT}/$9/" \
        -e "s/\${P8PORT}/${10}/" \
        -e "s/\${P9PORT}/${11}/" \
        -e "s/\${CAPORT}/${12}/" \
        -e "s#\${PEERPEM}#$PP#" \
        -e "s#\${CAPEM}#$CP#" \
        ccp-template.json 
}

function yaml_ccp {
    local PP=$(one_line_pem $5)
    local CP=$(one_line_pem $6)
    sed -e "s/\${ORG}/$1/" \
        -e "s/\${P0PORT}/$2/" \
        -e "s/\${P1PORT}/$3/" \
        -e "s/\${P2PORT}/$4/" \
        -e "s/\${P3PORT}/$5/" \
        -e "s/\${P4PORT}/$6/" \
        -e "s/\${P5PORT}/$7/" \
        -e "s/\${P6PORT}/$8/" \
        -e "s/\${P7PORT}/$9/" \
        -e "s/\${P8PORT}/${10}/" \
        -e "s/\${P9PORT}/${11}/" \
        -e "s/\${CAPORT}/${12}/" \
        -e "s#\${PEERPEM}#$PP#" \
        -e "s#\${CAPEM}#$CP#" \
        ccp-template.yaml | sed -e $'s/\\\\n/\\\n        /g'
}

ORG=1
P0PORT=7051
P1PORT=8051
P2PORT=9051
P3PORT=10051
P4PORT=11051
P5PORT=12051
P6PORT=13051
P7PORT=14051
P8PORT=15051
P9PORT=16051
CAPORT=7054
PEERPEM=crypto-config/peerOrganizations/org1.example.com/tlsca/tlsca.org1.example.com-cert.pem
CAPEM=crypto-config/peerOrganizations/org1.example.com/ca/ca.org1.example.com-cert.pem

echo "$(json_ccp $ORG $P0PORT $P1PORT $P2PORT $P3PORT $P4PORT $P5PORT $P6PORT $P7PORT $P8PORT $P9PORT $CAPORT $PEERPEM $CAPEM)" > connection-org1.json
echo "$(yaml_ccp $ORG $P0PORT $P1PORT $P2PORT $P3PORT $P4PORT $P5PORT $P6PORT $P7PORT $P8PORT $P9PORT $CAPORT $PEERPEM $CAPEM)" > connection-org1.yaml

ORG=2
P0PORT=17051
P1PORT=18051
P2PORT=19051
P3PORT=20051
P4PORT=21051
P5PORT=22051
P6PORT=23051
P7PORT=24051
P8PORT=25051
P9PORT=26051
CAPORT=8054
PEERPEM=crypto-config/peerOrganizations/org2.example.com/tlsca/tlsca.org2.example.com-cert.pem
CAPEM=crypto-config/peerOrganizations/org2.example.com/ca/ca.org2.example.com-cert.pem

echo "$(json_ccp $ORG $P0PORT $P1PORT $P2PORT $P3PORT $P4PORT $P5PORT $P6PORT $P7PORT $P8PORT $P9PORT $CAPORT $PEERPEM $CAPEM)" > connection-org2.json
echo "$(yaml_ccp $ORG $P0PORT $P1PORT $P2PORT $P3PORT $P4PORT $P5PORT $P6PORT $P7PORT $P8PORT $P9PORT $CAPORT $PEERPEM $CAPEM)" > connection-org2.yaml
