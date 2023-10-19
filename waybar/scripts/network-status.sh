#!/bin/bash

ifconfig | grep wlp5s0 -A 1 | grep "inet" | awk '{print $2}'
