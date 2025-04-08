#!/bin/bash

cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')

if (( $(echo "$cpu_usage > 70.0" | bc -l) )); then
    echo "High CPU usage: $cpu_usage%" | mail -s "CPU Alert!" you@example.com
fi
