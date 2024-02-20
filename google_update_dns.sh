#!/bin/bash
source ~/secrets/google_domains.sh

UPDATE_STATUS="`wget -qO- https://$GOOGLE_DOMAINS_USERNAME:$GOOGLE_DOMAINS_PASSWORD@domains.google.com/nic/update?hostname=$GOOGLE_DOMAINS_HOSTNAME`"
printf "$UPDATE_STATUS on `date '+%A, %b %d, @ %r'`\n" >> ~/logs/google_domains_dns_update.txt
