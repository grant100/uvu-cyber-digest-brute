#!/bin/bash

#Color constants
RED='\033[0;31m'
GRN='\033[0;32m'
NC='\033[0m' 

password=4425
username=infomte
realm=members only
method=GET
url="/"
nonce=cPmikbouBQA=92809400a6834c1fbc7b098b91e0fe759da84dcd
nc=00000002
cnonce=760a2297807a0a51
qop=auth


clear
echo "************************************************"
echo " 		      Digest Bruteforce              *"
echo "************************************************"
echo "H1 = MD5($username:$realm:$password)"
  hash1="$(echo -n $username:$realm:$password | md5sum | awk '{print $1}')"
#  echo hash1: $hash1
echo "H2 = MD5($method:url)"
  hash2="$(echo -n $method:$url | md5sum | awk '{print $1}')"
#  echo hash2: $hash2
echo "response = MD5($hash1:$nonce:$nc:$cnonce:$qop:$hash2)"
  calculated="$(echo -n $hash1:$nonce:$nc:$cnonce:$qop:$hash2 | md5sum | cut -d " " -f1)"
echo "${GRN}$response${NC}"



