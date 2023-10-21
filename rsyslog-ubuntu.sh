#!/bin/bash

# Define default values
DEFAULT_GRAYLOG_SERVER_IP="192.168.1.14"
DEFAULT_GRAYLOG_SERVER_PORT="1514"

# Use command-line arguments or default values
GRAYLOG_SERVER_IP="${1:-$DEFAULT_GRAYLOG_SERVER_IP}"
GRAYLOG_SERVER_PORT="${2:-$DEFAULT_GRAYLOG_SERVER_PORT}"

# Check if rsyslog is installed
if ! command -v rsyslogd &> /dev/null; then
    echo "rsyslog is not installed. Installing..."
    sudo apt install rsyslog -y
fi

# The location of the new rsyslog.conf file. The file will be created by this script.
RSYSLOG_CONF="/etc/rsyslog.conf"

# Backup the rsyslog configuration file
sudo cp "$RSYSLOG_CONF" "$RSYSLOG_CONF.bak"

# Add configuration to forward logs to Graylog
echo "*.emerg @${GRAYLOG_SERVER_IP}:${GRAYLOG_SERVER_PORT}" | sudo tee -a "$RSYSLOG_CONF" > /dev/null
echo "*.alert @${GRAYLOG_SERVER_IP}:${GRAYLOG_SERVER_PORT}" | sudo tee -a "$RSYSLOG_CONF" > /dev/null
echo "*.crit @${GRAYLOG_SERVER_IP}:${GRAYLOG_SERVER_PORT}" | sudo tee -a "$RSYSLOG_CONF" > /dev/null
echo "*.err @${GRAYLOG_SERVER_IP}:${GRAYLOG_SERVER_PORT}" | sudo tee -a "$RSYSLOG_CONF" > /dev/null
echo "*.warning @${GRAYLOG_SERVER_IP}:${GRAYLOG_SERVER_PORT}" | sudo tee -a "$RSYSLOG_CONF" > /dev/null

# Restart rsyslog
sudo service rsyslog restart

echo "rsyslog has been configured to forward logs to Graylog at ${GRAYLOG_SERVER_IP}:${GRAYLOG_SERVER_PORT}."
echo "Please verify that Graylog is correctly configured to receive syslog messages by checking for events in Graylog."
