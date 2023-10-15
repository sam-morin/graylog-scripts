#!/bin/bash

GRAYLOG_SERVER_IP="192.168.1.14"
RSYSLOG_CONF="/etc/rsyslog.conf"

# Check if rsyslog is installed
if ! command -v rsyslogd &> /dev/null; then
    echo "rsyslog is not installed. Installing..."
    sudo apt install rsyslog -y
fi

# Backup the rsyslog configuration file
sudo cp "$RSYSLOG_CONF" "$RSYSLOG_CONF.bak"

# Add configuration to forward logs to Graylog
echo "*.emerg @${GRAYLOG_SERVER_IP}:1514" | sudo tee -a "$RSYSLOG_CONF" > /dev/null
echo "*.alert @${GRAYLOG_SERVER_IP}:1514" | sudo tee -a "$RSYSLOG_CONF" > /dev/null
echo "*.crit @${GRAYLOG_SERVER_IP}:1514" | sudo tee -a "$RSYSLOG_CONF" > /dev/null
echo "*.err @${GRAYLOG_SERVER_IP}:1514" | sudo tee -a "$RSYSLOG_CONF" > /dev/null
echo "*.warning @${GRAYLOG_SERVER_IP}:1514" | sudo tee -a "$RSYSLOG_CONF" > /dev/null

# Restart rsyslog
sudo service rsyslog restart

echo "rsyslog has been configured to forward logs to Graylog at ${GRAYLOG_SERVER_IP}:514."
echo "Please verify that Graylog is correctly configured to receive syslog messages."
