# `kawasaki/`

This directory contains various scripts specific to my machine called `kawasaki`.

### Setup

`kawasaki/setup/` contains scripts that need to be added to the filesystem once, typically during the initial machine setup. To automatically copy these scripts to their designated locations, run the following script:

```
sudo kawasaki/setup/copy
```

### Utility

`kawasaki/reset-network` is a script that reconnects the network module to the kernel. It is useful for reconnecting to Wifi.
