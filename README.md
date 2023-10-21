# graylog-scripts

Deploy on Ubuntu (prompt for sudo)
```shell
curl -sSL https://raw.githubusercontent.com/sam-morin/graylog-scripts/main/rsyslog-ubuntu.sh | bash
```
Using custom server and port as arguments:
```shell
curl -sSL https://raw.githubusercontent.com/sam-morin/graylog-scripts/main/rsyslog-ubuntu.sh | bash -s "10.10.5.3" "514"
```

Deploy on Ubuntu (don't prompt for sudo, user is already root (in the case sudo doesn't exist on the system)):
```shell
curl -sSL https://raw.githubusercontent.com/sam-morin/graylog-scripts/main/rsyslog-ubuntu-root.sh | bash
```
Using custom server and port as arguments:
```shell
curl -sSL https://raw.githubusercontent.com/sam-morin/graylog-scripts/main/rsyslog-ubuntu-root.sh | bash -s "10.10.5.3" "514"
```
