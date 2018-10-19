#!/bin/bash

#Color constants
RED='\033[0;31m'
GRN='\033[0;32m'
NC='\033[0m' 

password=4425
username=infomte
realm=members\ only
method=GET
url=/
nonce=cPmikbouBQA=92809400a6834c1fbc7b098b91e0fe759da84dcd
nc=00000001
cnonce=6bc37926abce6649
qop=auth


clear
echo "H1:  MD5($username:$realm:$password)"
  hash1="$(echo -n $username:$realm:$password | md5sum | awk '{print $1}')"
  echo -e "hash1: ${GRN}$hash1${NC}"
echo "H2:  MD5($method:$url)"
  hash2="$(echo -n $method:$url | md5sum | awk '{print $1}')"
  echo -e "hash2: ${GRN}$hash2${NC}"
echo "response = MD5($hash1:$nonce:$nc:$cnonce:$qop:$hash2)"
  calculated="$(echo -n $hash1:$nonce:$nc:$cnonce:$qop:$hash2 | md5sum | cut -d " " -f1)"
echo -e "${GRN}$calculated${NC}"



