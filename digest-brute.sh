#!/bin/bash

#Color constants
RED='\033[0;31m'
GRN='\033[0;32m'
NC='\033[0m' 
MG='\033[0;34m'
YW='\033[1;33m'

password=4425
username=infomte
realm=members\ only
method=GET
url=\"/\"
nonce=cPmikbouBQA=92809400a6834c1fbc7b098b91e0fe759da84dcd
nc=00000001
cnonce=6bc37926abce6649
qop=auth


clear
echo -e "${YW}Calculating Digest Authentication Response *** ${NC}\r\n"
echo -e "Calculating H1 using ${MG}MD5($username:$realm:$password) ${NC}"
  hash1="$(echo -n $username:$realm:$password | md5sum | awk '{print $1}')"
  echo -e "${RED}--->hash1: ${GRN}$hash1${NC}\r\n"
echo -e "Calculating H2 using ${MG}MD5($method:$url)${NC}"
  hash2="$(echo -n $method:$url | md5sum | awk '{print $1}')"
  echo -e "${RED}--->hash2: ${GRN}$hash2${NC}\r\n"
echo -e "Calculating response using: \r\n${MG}MD5($hash1${YW}:${MG}$nonce${YW}:${MG}\r\n$nc${YW}:${MG}$cnonce${YW}:${MG}$qop${YW}:${MG}$hash2)${NC}"
  calculated="$(echo -n $hash1:$nonce:$nc:$cnonce:$qop:$hash2 | md5sum | cut -d " " -f1)"
echo -e "${RED}--->Response:${GRN}$calculated${NC}\r\n"



