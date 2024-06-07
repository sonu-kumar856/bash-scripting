#!/bin/bash

# Get CPU usage 
cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
echo "CPU Usage: $cpu_usage%"

# Get RAM usage
total_mem=$(free | grep Mem | awk '{print $2}')
used_mem=$(free | grep Mem | awk '{print $3}')
ram_usage=$(echo "scale=2; $used_mem/$total_mem * 100" | bc)
echo "RAM Usage: $ram_usage%"

# Get overall disk usage 
used=$(df | awk '$1 ~ /^\/dev\// {used+=$3} END {print used}')
total=$(df | awk '$1 ~ /^\/dev\// {total+=$2} END {print total}')
disk_usage=$(echo "scale=2; $used/$total*100" | bc)
echo "Disk Usage: $disk_usage%"

