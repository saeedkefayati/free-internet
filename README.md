<figure>
  <pre role="img" aria-label="ASCII BANNER" style="text-align:center; font-size:0.75rem;">
.--------------------------------------------------------------------------------.
|                                                                                |
|                                                                                |
|   _____ _____ _____ _____    _____ _____ _____ _____ _____ _____ _____ _____   |
|  |   __| __  |   __|   __|  |     |   | |_   _|   __| __  |   | |   __|_   _|  |
|  |   __|    -|   __|   __|  |-   -| | | | | | |   __|    -| | | |   __| | |    |
|  |__|  |__|__|_____|_____|  |_____|_|___| |_| |_____|__|__|_|___|_____| |_|    |
|                                                                                |
|                                                                                |
'--------------------------------------------------------------------------------'
  </pre>
</figure>

# Free Internet On OpenWrt OS

Free and Open Internet for All

<br/>

## Smart Installation

1. Install Dependencies<br/>
```bash
  opkg install git
```

```bash
  opkg install git-http
```


2. Usage with this command<br/>
- Github:
```bash
sh <(wget -qO- https://raw.githubusercontent.com/saeedkefayati/free-internet/main/install.sh)
```

- Githack:
```bash
sh <(wget -qO- https://raw.githack.com/saeedkefayati/free-internet/main/install.sh)
```

- jsdelivr CDN:
```bash
sh <(wget -qO- https://cdn.jsdelivr.net/gh/saeedkefayati/free-internet@main/install.sh)
```

- statically CDN
```bash
sh <(wget -qO- https://cdn.statically.io/gh/saeedkefayati/free-internet/main/install.sh)
```

<br/>

## Manual Installation

1. Install Dependencies<br/>
```bash
  cd /root
```
```bash
  wget -O free-internet.zip https://github.com/saeedkefayati/free-internet/archive/refs/heads/main.zip
```
```bash
  opkg install unzip
```


2. Unzip Dependencies<br/>
```bash
  unzip free-internet.zip && rm -rf free-internet.zip
```
```bash
  mv free-internet-main free-internet
```

3. Executable Dependencies<br/>
```bash
  find ./free-internet -type f -name "*.sh" -exec chmod +x {} \;
```
```bash
  cd free-internet && ./main.sh
```

4. Add Shortcut Command (optional) - can use free-internet command<br/>
```bash
  echo '#!/bin/sh' > /usr/bin/free-internet && echo 'cd /root/free-internet && ./main.sh' >> /usr/bin/free-internet && chmod +x /usr/bin/free-internet
```

<br/>

## Module Project

- [Passwall1](https://github.com/saeedkefayati/passwall1)

- [Passwall2](https://github.com/saeedkefayati/passwall2)

- [V2rayA](https://github.com/saeedkefayati/v2raya)

<br/>

## Features

- Passwall

<br/>

## Roadmap

- ~~Passwall~~
- Passwall2
- V2rayA

<br/>

## Authors

- [@saeedkefayati](https://www.github.com/saeedkefayati)

<br/>

## Badges

[![MIT License](https://img.shields.io/badge/License-MIT-green.svg)](https://choosealicense.com/licenses/mit/)
