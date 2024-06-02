#!/bin/bash
 
 # Check for service name argument
 if [ "$#" -ne 1 ]; then
     echo "Usage: $0 <service-label>"
     exit 1
 fi
 
 SERVICE_LABEL=$1
 
 # Check the service status using launchctl
 if launchctl list | grep -q "$SERVICE_LABEL"; then
     echo "The service with label '$SERVICE_LABEL' is running."
 else
     echo "The service with label '$SERVICE_LABEL' is NOT running."
 fi
 
 exit 0