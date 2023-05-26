# Install Cockpit on Ubuntu Server

Cockpit is an open-source web-based server management tool that provides a user-friendly interface to manage Linux systems. It offers various features such as system updates, service management, Docker container management, network and storage management, and a web-based terminal. This guide will walk you through the steps to install Cockpit on Ubuntu Server.

## Adding 45drives Repository

Before installing Cockpit, we need to add the 45drives repository to our system. This repository provides additional plugins for Cockpit.

1. Open a terminal and run the following command to add the 45drives repository:

   ```bash
   curl -sSL https://repo.45drives.com/setup | sudo bash
   ```

2. Update your system packages using the following command:

   ```bash
   sudo apt update && sudo apt upgrade -y
   ```

## Installing Cockpit

Now we can install Cockpit on Ubuntu Server using the APT package manager.

1. Open a terminal and run the following command to install Cockpit:

   ```bash
   sudo apt install cockpit
   ```

## Starting and Enabling Cockpit Service

After the installation, we need to start the Cockpit service and enable it to start automatically on system boot.

1. Start the Cockpit service by running the following command:

   ```bash
   sudo systemctl start cockpit cockpit.socket
   ```

2. Enable the Cockpit service to start on boot by running the following command:

   ```bash
   sudo systemctl enable cockpit cockpit.socket
   ```

## Installing Cockpit Plugins

Cockpit supports various plugins that extend its functionality. You can choose the plugins you want to install based on your requirements.

1. Run the following command to search for available Cockpit plugins:

   ```bash
   apt search cockpit
   ```

2. Make a list of the plugins you want to install. For example, to install multiple plugins, use the following command:

   ```bash
   sudo apt install cockpit-benchmark cockpit-identities cockpit-navigator cockpit-pcp cockpit-sosreport cockpit-file-sharing cockpit-packagekit
   ```

## Accessing Cockpit Web GUI

Now that Cockpit is installed and configured, you can access the web-based management interface using a web browser.

1. Open a web browser on a system that can access the IP address of the server where Cockpit is installed.

2. Enter the following address in the URL section, replacing `server-ip-address` with the actual IP address of your server:

   ```bash
   https://server-ip-address:9090
   ```

3. You may encounter an HTTPS warning about the connection not being private. Click on the "Advanced" button and proceed to your IP address (unsafe).

4. You will be redirected to the Cockpit login interface. Use a non-root user with sudo access or the root user to log in and manage your server through the Cockpit interface.

**Note: If you encounter the "cannot refresh cache whilst offline" error in Cockpit -> Software Updates, it might be due to the use of networkd as the renderer in Netplan. You can resolve this issue by switching the renderer to NetworkManager

. Edit the Netplan YAML file located in `/etc/netplan` to make the necessary changes.**

```bash
sudo nano /etc/netplan/00-installer-config.yaml
```

By default, renderer was set to “networkd”, changed to “NetworkManager”. Simple example .yaml below:

```markdown
network:
  ethernets:
    enp2s0:
      dhcp4: true
  version: 2
  renderer: NetworkManager
```

## [`Home`](Table_of_Contents.md) [`Next`](Docker_and_Docker_Compose.md)
