# Graylog helpful scripts and config files

There should be more bootstrapping and setup scripts/workflows available with Graylog and sadly there is not. This is merely an accidental attempt at that.

<br/>

## Prompt for sudo
Deploy rsyslog on Ubuntu:
```shell
curl -sSL https://raw.githubusercontent.com/sam-morin/graylog-scripts/main/rsyslog-ubuntu.sh | bash
```
Using custom server and port as arguments (rsyslog, Ubuntu):
```shell
curl -sSL https://raw.githubusercontent.com/sam-morin/graylog-scripts/main/rsyslog-ubuntu.sh | bash -s "10.10.5.3" "514"
```

<br/>

## Don't prompt for sudo
Deploy rsyslog on Ubuntu:
```shell
curl -sSL https://raw.githubusercontent.com/sam-morin/graylog-scripts/main/rsyslog-ubuntu-root.sh | bash
```
Using custom server and port as arguments (rsyslog, Ubuntu):
```shell
curl -sSL https://raw.githubusercontent.com/sam-morin/graylog-scripts/main/rsyslog-ubuntu-root.sh | bash -s "10.10.5.3" "514"
```
