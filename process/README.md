# PRESSone Node Process Monitor

> PRESSone node process monitor tools.

[![Build Status](http://img.shields.io/travis/badges/badgerbadgerbadger.svg?style=flat-square)](https://travis-ci.org/badges/badgerbadgerbadger) [![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](http://badges.mit-license.org)

## Table of Contents

- [Installation](#installation)
- [Features](#features)
- [Contributing](#contributing)
- [Team](#team)
- [FAQ](#faq)
- [Support](#support)
- [License](#license)

## Installation

- Ubuntu 16.04.1 LTS
- Written in bash

### Clone

- Clone this repo to your server using:

``` bash
sudo mkdir -p /data/monitor/exinpool
cd /data/monitor/exinpool
sudo git clone https://github.com/ExinPool/PRESSone
```

### Setup

Search `7000000012` in Mixin Messenger and add **Webhook** as contact.

Invite Webhook and somebody who want to receive monitor message to a small group. Open Webhook in the group, you can see the access token.

> Note: Only the owner of the group can get the access token via Webhook.

Change some varibles like this.

``` bash
LOG_FILE="prs_process.log"
PROCESS="nodeos"
PROCESS_NUM=1
SERVICE="PRESSone"
WEBHOOK_URL="https://webhook.exinwork.com/api/send?access_token"
ACCESS_TOKEN=""
```

Add crontab like this.

``` bash
# PRESSone node process monitor
* * * * * nohup bash /data/monitor/exinpool/PRESSone/process/prs_process.sh >> /data/monitor/exinpool/PRESSone/process/prs_process.log &
```

The crontab will run every minute then you can check the log in `prs_process.log`.

## Features

- Monitor Mixin node process
- Send alarm message when node process is abnormal
- Send alarm message via Webhook which based on Mixin API

## Contributing

To be continued.

## Team

@ExinPool

## FAQ

To be continued.

## Support

Reach out to us at one of the following places!

- Website at <a href="https://exinpool.com" target="_blank">`exinpool.com`</a>
- Twitter at <a href="http://twitter.com/ExinPool" target="_blank">`@ExinPool`</a>
- Email at `robin@exin.one`

## License

[![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](http://badges.mit-license.org)

- **[MIT license](https://opensource.org/licenses/mit-license.php)**
- Copyright 2019 © <a href="https://exinpool.com" target="_blank">ExinPool</a>.