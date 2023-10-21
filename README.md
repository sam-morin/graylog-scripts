# graylog-scripts

Deploy on Ubuntu (prompt for sudo)
```shell
curl -sSL https://raw.githubusercontent.com/sam-morin/graylog-scripts/main/rsyslog-ubuntu.sh | bash
```

Deploy on Ubuntu (don't prompt for sudo, user is already root (in the case sudo doesn't exist on the system)):
```shell
curl -sSL https://raw.githubusercontent.com/sam-morin/graylog-scripts/main/rsyslog-ubuntu-root.sh | bash
```
