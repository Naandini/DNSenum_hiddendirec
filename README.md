•The dnsenum_hiddendirec.sh is a custom bash script designed to uncover critical network and web structure details. It focuses on two major cybersecurity tasks: DNS Enumeration and Hidden Directory Discovery. The logic and tool choices behind each component are thoroughly documented in the file DNS ENUMERATION & HIDDEN DIRECTORIES.txt, while wordlist.txt provides a curated list of keywords used during scanning processes for effective directory brute-forcing.

•DNS (Domain Name System) Enumeration is the process of gathering information about domain names and their corresponding IP addresses. It’s a technique used in ethical hacking and penetration testing to map out the structure of a target's DNS records.
•Why it’s used:
To discover subdomains (e.g., mail.example.com)
To extract important DNS records like A (Address), MX (Mail Exchange), NS (Name Server), and TXT records
To detect misconfigurations or exposed services

•Hidden Directories
Hidden directories are unlinked or non-public web folders on a server that are not meant to be easily discoverable by visitors.
•Why it’s used:
These directories can contain sensitive files, backups, admin panels, or configuration data.
Discovering them can reveal vulnerabilities or entry points for attackers.

•Wordlist.txt
This file includes a collection of commonly used directory names (e.g., admin, backup, test, uploads) that are used during the scanning process.
These are tested against a target website to find if any of these folders are accessible.

IMPORTANT NOTE:-
•Run the script only after bundling it with the wordlist in the same location.
•Keep the wordlist.txt and .sh file together—separation breaks functionality.
•Script won’t function properly unless the wordlist is present in the same directory—keep them together before running.
