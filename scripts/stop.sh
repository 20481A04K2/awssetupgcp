#!/bin/bash
service_name="nudgeengine"
if systemctl is-active --quiet $service_name; then
  echo "Stopping $service_name..."
  sudo systemctl stop $service_name
else
  echo "$service_name is not running."
fi
