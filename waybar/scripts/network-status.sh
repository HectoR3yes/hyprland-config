#!/bin/bash

ifconfig | grep wlan0 -A 1 | grep "inet" | awk '{print $2}'
