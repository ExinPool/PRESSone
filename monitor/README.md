# PRESSone Node Blocks Monitor

> PRESSone node blocks monitor tools.

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

Search `7000000012` in [Mixin Messenger](https://mixin.one/messenger) and add **[Webhook](https://mixin.one/codes/4d792128-1db8-4baf-8d90-d0d8189a4a7e)** as contact.

Invite Webhook and somebody who want to receive monitor message to a small group in Mixin Messenger. Open Webhook in the group, you can see the access token.

> Note: The access token is only available for the owner of the group.

Change some varibles like this in the `prs_blocks.sh`.

``` bash
LOG_FILE="prs_blocks.log"
SERVICE="PRESSone"
WEBHOOK_URL="https://webhook.exinwork.com/api/send?access_token"
ACCESS_TOKEN=""
REMOTE_NODE="http://51.68.201.144:8888"
LOCAL_NODE="http://127.0.0.1:8888"
```

Add crontab like this in the server.

``` bash
# PRESSone node blocks monitor
* * * * * nohup bash /data/monitor/exinpool/PRESSone/monitor/prs_process.sh >> /data/monitor/exinpool/PRESSone/monitor/prs_blocks.log &
```

The crontab will run every minute then you can check the log in `prs_blocks.log`.

## Features

- Monitor PRESSone node blocks
- Send alarm message when node blocks is full sync
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