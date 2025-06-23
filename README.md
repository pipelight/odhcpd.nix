# Odhcpd for nixos

The [OpenWrt odhcpd](https://github.com/openwrt/odhcpd) is a minimal
dhcpv4 and dhcpv6 router that is easy to configure.

(I needed something that just works,
while dhcpv6 is getting implemented
in the great rust dhcp server [dora](https://github.com/bluecatengineering/dora))

This flake builds odhcpd against the master branch and not against a fixed release,
so you are sure to be up to date.

## Why a flake?

I had to move fast and couldn't wait for a nix package to be merged to unstable.
But don't worry the code base is so ridiculously small
that building from source happens in a blink.

Of course there is a module that starts the required systemd units.

## Module configuration

```nix

```
