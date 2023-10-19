#!/bin/sh

ifconfig | grep tun0 &>/dev/null && (echo "󰆧  $(ifconfig tun0 | grep inet | awk '{print $2}' | head -n 1)") || echo "󱐝  Disconnected"
