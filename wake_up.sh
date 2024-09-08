#!/bin/bash
source ~/secrets/desktop_mac_addresses.sh

sudo etherwake $DESKTOP_MAC_ADDRESS_WIRED
sudo wakeonlan $DESKTOP_MAC_ADDRESS_WIRED
sudo etherwake $DESKTOP_MAC_ADDRESS_WIFI
sudo wakeonlan $DESKTOP_MAC_ADDRESS_WIFI
