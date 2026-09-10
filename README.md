# NixOS

My personal NixOS flake configuration

## Setup

Clone the repository:
```console
$ sudo git clone https://github.com/primepvi/nixos.git /etc/nixos
$ cd /etc/nixos
```

Build and activate the configuration:
```console
$ sudo nixos-rebuild build --flake .#nixos
```
Or only build the configuration without activate it:
```console
$ sudo nixos-rebuild switch --flake .#nixos
```
