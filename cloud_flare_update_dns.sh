#!/bin/bash
source ~/secrets/cloud_flare.sh

CURRENT_DATE=$(date '+%A, %b %d, @ %r')
IP_ADDRESS=$(curl -s ifconfig.co/)

UPDATE_STATUS="$(curl -s -X PUT "https://api.cloudflare.com/client/v4/zones/$CLOUD_FLARE_ZONE_ID/dns_records/$CLOUD_FLARE_RECORD_ID" \
     -H "Authorization: Bearer $CLOUD_FLARE_API_TOKEN" \
     -H "Content-Type: application/json" \
     --data '{"type":"A","name":"'"$CLOUD_FLARE_HOSTNAME"'","content":"'"$IP_ADDRESS"'","ttl":1,"proxied":true}')"

SUCCESS_MESSAGE=$(echo "$UPDATE_STATUS" | jq -r '.success')

if [ "$SUCCESS_MESSAGE" = "true" ]; then
    printf "SUCCESSFULLY UPDATED on %s\n" "$CURRENT_DATE" >> ~/logs/cloud_flare_dns_update_log.txt
else
    printf "FAILED on %s\n" "$CURRENT_DATE" >> ~/logs/cloud_flare_dns_update_log.txt
fi
