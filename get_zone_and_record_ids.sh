#!/bin/bash

DOMAIN_NAME="your_domain.com"
CLOUDFLARE_API_TOKEN="your_api_token"
DOMAIN_RECORD="record.your_domain.com"

# Get Zone ID for the domain
ZONE_ID=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones?name=$DOMAIN_NAME" \
     -H "Authorization: Bearer $CLOUDFLARE_API_TOKEN" \
     -H "Content-Type: application/json" | jq -r '.result[0].id')

# Check if Zone ID was found
if [ "$ZONE_ID" = "null" ] || [ -z "$ZONE_ID" ]; then
    echo "Error: Unable to retrieve Zone ID for domain $DOMAIN_NAME"
    exit 1
fi

echo "Zone ID for $DOMAIN_NAME: $ZONE_ID"

# Get DNS Record ID for the specific DNS entry
RECORD_ID=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones/$ZONE_ID/dns_records?type=A&name=$DOMAIN_RECORD" \
     -H "Authorization: Bearer $CLOUDFLARE_API_TOKEN" \
     -H "Content-Type: application/json" | jq -r '.result[0].id')

# Check if DNS Record ID was found
if [ "$RECORD_ID" = "null" ] || [ -z "$RECORD_ID" ]; then
    echo "Error: Unable to retrieve DNS Record ID for $DOMAIN_RECORD"
    exit 1
fi

echo "DNS Record ID for $DOMAIN_RECORD: $RECORD_ID"
