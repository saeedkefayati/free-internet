
# Free Internet On OpenWrt OS

Free and Open Internet for All

[![AGPL License](https://img.shields.io/badge/License-AGPL%20v3-blue.svg)](https://choosealicense.com/licenses/agpl-3.0)
![GitHub last commit](https://img.shields.io/github/last-commit/saeedkefayati/free-internet)
![GitHub top language](https://img.shields.io/github/languages/top/saeedkefayati/free-internet)
![GitHub repo size](https://img.shields.io/github/repo-size/saeedkefayati/free-internet)
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/saeedkefayati/free-internet)


<br/>

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


## Features

**Automatic Installation by OpenWrt Type**
- 🟢 Snapshot 
- 🟡 Release Candidate  
- 🔵 Stable  
- 🧰 Service  
- ⚫ Legacy  

<br/>

**Supports All Architectures**
- x86  
- ARM 32-bit (ARMv5/6/7)  
- ARM 64-bit (AArch64) 
- MIPS 32-bit
- MIPS 64-bit 
- PowerPC  
- RISC-V 64-bit 
- LoongArch 64-bit


<br/>

## Smart Installation (Recommend)

1. Install Dependencies<br/>
```bash
opkg install git git-http
```

<br/>

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

- [Passwall1](https://github.com/saeedkefayati/openwrt-passwall1)

- [Passwall2](https://github.com/saeedkefayati/openwrt-passwall2)

- [V2rayA](https://github.com/saeedkefayati/openwrt-v2raya)

<br/>

## Roadmap

- ~~Passwall1~~
- ~~Passwall2~~
- V2rayA
