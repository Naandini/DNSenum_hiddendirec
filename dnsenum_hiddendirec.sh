#!/bin/bash 
figlet -f small "DNS ENUMERATION & FINDING HIDDEN DIRECTORIES USING BRUTE FORCE"

#ask user for target domain
read -p "Enter the target domain: " domain

echo "Running DNS Enumeration for $domain...."

#DNS Records
echo "A records for $domain: "
dig +short A $domain

echo "MX records for $domain: "
dig +short MX $domain

echo "NS records for $domain: "
dig +short NS $domain

echo "========================================================================"

echo "Checking some common subdomain....."

for sub in www mail ftp admin test dev;
do
     host $sub.$domain | grep "has address" && echo "$sub.$domain is live"
done


echo "========================================================================"

echo "Starting finding hidden directories using brute force on $domain..... "

wordlist="wordlist.txt"

echo "Scanning Ports"

 if [[ ! -f "$wordlist" ]];then
      echo "Wordlist file "$wordlist" not found!"
      exit 1
 fi

while IFS= read -r dir;
do
    [[ -z "$dir" ]] && continue
    url="${domain%/}/$dir/"
    status_code=$(curl -s -o /dev/null -w "%{http_code}" "$url")

    if [[ "$status_code" == "200" || "$status_code" == "301" || "$status_code" == "403" ]]  
    then
        echo "Found: $url (HTTP $status_code)"
    fi

done < "$wordlist"

echo "Scan Complete for $domain."
 
