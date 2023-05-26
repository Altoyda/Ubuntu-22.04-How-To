# How to Install Ubuntu 22.04 Server

For those that do not want to do this the manual way here is a link to a [`install.sh`](install.sh). To use it you need to do. You have to be root user to use this, If you not the root you will not be able to use it.

```bash
https://github.com/Altoyda/Ubuntu-22.04-How-To.git
```

The line `USERNAME="lewis"` sets the username variable to "yourname". You may need to replace "lewis" with the actual username you want to set.

```bash
sudo nano install.sh
```

```bash
chmod +x install.sh
```

```bash
./install.sh
```

## Table of Contents

For those that want a one page guide go to this link [Ubuntu-How-To](Ubuntu-How-To.md).

- [Introduction](Introduction.md#introduction)
  - [Step 1: Adding Universe Repository](Introduction.md#step-1-adding-universe-repository)
  - [Step 2: Adding Multiverse Repository](Introduction.md#step-2-adding-multiverse-repository)
  - [Step 3: Updating and Upgrading](Introduction.md#step-3-updating-and-upgrading)
- [Obtaining Root Privileges](Obtaining_Root_Privileges.md#obtaining-root-privileges)
  - [Step 1: Obtaining Root Privileges](Obtaining_Root_Privileges.md#step-1-obtaining-root-privileges)
  - [Setting a Root Password (Optional)](Obtaining_Root_Privileges.md#setting-a-root-password-optional)
  - [Logging in as Root User (Optional)](Obtaining_Root_Privileges.md#logging-in-as-root-user-optional)
  - [Step 2: Rebooting the System](Obtaining_Root_Privileges.md#step-2-rebooting-the-system)
- [Installing Nala](Installing_Nala.md#installing-nala)
  - [Step 1: Installing Nala](Installing_Nala.md#step-1-installing-nala)
  - [Step 2: Speeding up Downloads with Nala](Installing_Nala.md#step-2-speeding-up-downloads-with-nala)
  - [Step 3: Updating the System with Nala](Installing_Nala.md#step-3-updating-the-system-with-nala)
  - [Step 4: Converting APT to Nala](Installing_Nala.md#step-4-converting-apt-to-nala)
- [Editing the needrestart.conf File](Editing_The_Needrestart.md#editing-the-needrestartconf-file)
  - [Step 1: Editing the needrestart.conf File](Editing_The_Needrestart.md#step-1-editing-the-needrestartconf-file)
  - [Step 2: Modifying the needrestart.conf File](Editing_The_Needrestart.md#step-2-modifying-the-needrestartconf-file)
  - [Step 3: Saving the Changes](Editing_The_Needrestart.md#step-3-saving-the-changes)
- [Setting the time and configuring NTP](Time_and_NTP.md#setting-the-time-and-configuring-ntp)
  - [Step 1: Checking and Setting the Timezone](Time_and_NTP.md#step-1-checking-and-setting-the-timezone)
  - [Step 2: Enabling NTP (Network Time Protocol)](Time_and_NTP.md#step-2-enabling-ntp-network-time-protocol)
  - [Step 3: Configuring systemd-timesyncd (optional)](Time_and_NTP.md#step-3-configuring-systemd-timesyncd-optional)
- [Disabling Snap](Disabling_Snap.md#disabling-snap)
  - [Step 1: Disable Snap](Disabling_Snap.md#step-1-disable-snap)
  - [Step 2: Prevent Snap from Being Installed Again](Disabling_Snap.md#step-2-prevent-snap-from-being-installed-again)
- [Speeding up files and Memory](Files_and_Memory.md#speeding-up-files-and-memory)
  - [Step 1: Adjust System Settings](Files_and_Memory.md#step-1-adjust-system-settings)
  - [Step 2: Optimize System Performance with tuned-adm](Files_and_Memory.md#step-2-optimize-system-performance-with-tuned-adm)
- [How to Disable cloud-init](Disable_cloud-init.md#how-to-disable-cloud-init)
  - [Method 1: Using a Text File](Disable_cloud-init.md#method-1-using-a-text-file)
  - [Method 2: Modifying the Kernel Commandline](Disable_cloud-init.md#method-2-modifying-the-kernel-commandline)
- [Install Cockpit on Ubuntu Server](Cockpit.md#install-cockpit-on-ubuntu-server)
  - [Adding 45drives Repository](Cockpit.md#adding-45drives-repository)
  - [Installing Cockpit](Cockpit.md#installing-cockpit)
  - [Starting and Enabling Cockpit Service](Cockpit.md#starting-and-enabling-cockpit-service)
  - [Installing Cockpit Plugins](Cockpit.md#installing-cockpit-plugins)
  - [Accessing Cockpit Web GUI](Cockpit.md#accessing-cockpit-web-gui)
- [Install Docker and Docker Compose](Docker_and_Docker_Compose.md#install-docker-and-docker-compose)
  - [Step 1: Add Docker's Public GPG Key](Docker_and_Docker_Compose.md#step-1-add-dockers-public-gpg-key)
  - [Step 2: Add Docker Repository](Docker_and_Docker_Compose.md#step-2-add-docker-repository)
  - [Step 3: Update the System](Docker_and_Docker_Compose.md#step-3-update-the-system)
  - [Step 4: Install Docker and Docker Compose](Docker_and_Docker_Compose.md#step-4-install-docker-and-docker-compose)
  - [Step 5: Add User to Docker Group](Docker_and_Docker_Compose.md#step-5-add-user-to-docker-group)
  - [Step 6: Create Directory for Docker Data Storage](Docker_and_Docker_Compose.md#step-6-create-directory-for-docker-data-storage)
- [Install Portainer Docker UI Web Interface](Portainer.md#install-portainer-docker-ui-web-interface)
  - [Step 1: Create a Portainer Container](Portainer.md#step-1-create-a-portainer-container)
  - [Step 2: Verify the Portainer Container](Portainer.md#step-2-verify-the-portainer-container)
  - [Step 3: Access the Portainer Web UI](Portainer.md#step-3-access-the-portainer-web-ui)
- [Understanding the Dynamic motd](Dynamic_motd.md#understanding-the-dynamic-motd)
  - [Disabling motd news](Dynamic_motd.md#disabling-motd-news)
  - [Disabling parts of the dynamic motd](Dynamic_motd.md#disabling-parts-of-the-dynamic-motd)
  - [Disabling dynamic motd entirely](Dynamic_motd.md#disabling-dynamic-motd-entirely)
  - [Conclusion](Dynamic_motd.md#conclusion)

## [`Next`](Introduction.md)
