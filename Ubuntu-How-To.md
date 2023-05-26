# How to Install Ubuntu 22.04 Server

## Table of Contents

- [Introduction](#introduction)
  - [Step 1: Adding Universe Repository](#step-1-adding-universe-repository)
  - [Step 2: Adding Multiverse Repository](#step-2-adding-multiverse-repository)
  - [Step 3: Updating and Upgrading](#step-3-updating-and-upgrading)
- [Obtaining Root Privileges](#obtaining-root-privileges)
  - [Step 1: Obtaining Root Privileges](#step-1-obtaining-root-privileges)
  - [Setting a Root Password (Optional)](#setting-a-root-password-optional)
  - [Logging in as Root User (Optional)](#logging-in-as-root-user-optional)
  - [Step 2: Rebooting the System](#step-2-rebooting-the-system)
- [Installing Nala](#installing-nala)
  - [Step 1: Installing Nala](#step-1-installing-nala)
  - [Step 2: Speeding up Downloads with Nala](#step-2-speeding-up-downloads-with-nala)
  - [Step 3: Updating the System with Nala](#step-3-updating-the-system-with-nala)
  - [Step 4: Converting APT to Nala](#step-4-converting-apt-to-nala)
- [Editing the needrestart.conf File](#editing-the-needrestartconf-file)
  - [Step 1: Editing the needrestart.conf File](#step-1-editing-the-needrestartconf-file)
  - [Step 2: Modifying the needrestart.conf File](#step-2-modifying-the-needrestartconf-file)
  - [Step 3: Saving the Changes](#step-3-saving-the-changes)
- [Setting the time and configuring NTP](#setting-the-time-and-configuring-ntp)
  - [Step 1: Checking and Setting the Timezone](#step-1-checking-and-setting-the-timezone)
  - [Step 2: Enabling NTP (Network Time Protocol)](#step-2-enabling-ntp-network-time-protocol)
  - [Step 3: Configuring systemd-timesyncd (optional)](#step-3-configuring-systemd-timesyncd-optional)
- [Disabling Snap](#disabling-snap)
  - [Step 1: Disable Snap](#step-1-disable-snap)
  - [Step 2: Prevent Snap from Being Installed Again](#step-2-prevent-snap-from-being-installed-again)
- [Speeding up files and Memory](#speeding-up-files-and-memory)
  - [Step 1: Adjust System Settings](#step-1-adjust-system-settings)
  - [Step 2: Optimize System Performance with tuned-adm](#step-2-optimize-system-performance-with-tuned-adm)
- [How to Disable cloud-init](#how-to-disable-cloud-init)
  - [Method 1: Using a Text File](#method-1-using-a-text-file)
  - [Method 2: Modifying the Kernel Commandline](#method-2-modifying-the-kernel-commandline)
- [Install Cockpit on Ubuntu Server](#install-cockpit-on-ubuntu-server)
  - [Adding 45drives Repository](#adding-45drives-repository)
  - [Installing Cockpit](#installing-cockpit)
  - [Starting and Enabling Cockpit Service](#starting-and-enabling-cockpit-service)
  - [Installing Cockpit Plugins](#installing-cockpit-plugins)
  - [Accessing Cockpit Web GUI](#accessing-cockpit-web-gui)
- [Install Docker and Docker Compose](#install-docker-and-docker-compose)
  - [Step 1: Add Docker's Public GPG Key](#step-1-add-dockers-public-gpg-key)
  - [Step 2: Add Docker Repository](#step-2-add-docker-repository)
  - [Step 3: Update the System](#step-3-update-the-system)
  - [Step 4: Install Docker and Docker Compose](#step-4-install-docker-and-docker-compose)
  - [Step 5: Add User to Docker Group](#step-5-add-user-to-docker-group)
  - [Step 6: Create Directory for Docker Data Storage](#step-6-create-directory-for-docker-data-storage)
- [Install Portainer Docker UI Web Interface](#install-portainer-docker-ui-web-interface)
  - [Step 1: Create a Portainer Container](#step-1-create-a-portainer-container)
  - [Step 2: Verify the Portainer Container](#step-2-verify-the-portainer-container)
  - [Step 3: Access the Portainer Web UI](#step-3-access-the-portainer-web-ui)
- [Understanding the Dynamic motd](#understanding-the-dynamic-motd)
  - [Disabling motd news](#disabling-motd-news)
  - [Disabling parts of the dynamic motd](#disabling-parts-of-the-dynamic-motd)
  - [Disabling dynamic motd entirely](#disabling-dynamic-motd-entirely)
  - [Conclusion](#conclusion)

## Introduction

Ubuntu Server is a powerful and versatile operating system that can be used for a wide range of server applications. This guide will walk you through the step-by-step process of installing Ubuntu Server on your system. We will begin by adding the Universe and Multiverse repositories and then update the system to ensure we have the latest updates.

For those that do not want to do this the manual way here is a link to a [`install.sh`](install.sh). To use it you need to do. You have to be root user to use this, If you not the root you will not be able to use it.

```bash
git clone https://github.com/Altoyda/
```

```bash
chmod +x install.sh
```

```bash
./install.sh
```

## Step 1: Adding Universe Repository

The Universe repository in Ubuntu contains open-source software packages that are maintained by the Ubuntu community. To add the Universe repository, open a terminal and run the following command:

```bash
sudo add-apt-repository universe
```

This command will add the Universe repository to your system's software sources.

## Step 2: Adding Multiverse Repository

The Multiverse repository in Ubuntu contains software packages that are not freely distributable due to legal or copyright reasons. To add the Multiverse repository, open a terminal and run the following command:

```bash
sudo add-apt-repository multiverse
```

This command will add the Multiverse repository to your system's software sources.

## Step 3: Updating and Upgrading

Before proceeding with the installation, it is important to update and upgrade your system to ensure you have the latest updates and security patches. Open a terminal and run the following command:

```bash
sudo apt update && sudo apt upgrade -y
```

The `apt update` command will refresh the package lists and retrieve information about available updates. The `apt upgrade` command will install any available updates on your system. The `-y` flag is used to automatically answer "yes" to any prompts during the upgrade process.

This may take some time depending on your internet connection speed and the number of updates available. Once the process is complete, you will have an up-to-date system ready for the installation of Ubuntu Server.

Now that we have added the Universe and Multiverse repositories and updated the system, we can proceed with the installation of Ubuntu Server.

## Obtaining Root Privileges

In this section, we will cover how to obtain root privileges and reboot the system.

## Step 1: Obtaining Root Privileges

To run certain commands with root privileges, you can either use the `sudo` command or become the root user. In this guide, we will become the root user. Open a terminal and run the following command to become root:

```bash
sudo -s
```

You will be prompted to enter your password. Once you enter the password, you will have root privileges for the current session.

## Setting a Root Password (Optional)

By default, Ubuntu does not set a password for the root user. However, if you prefer to set a root password and log in as the root user, you can do so by running the following command:

```bash
sudo passwd root
```

You will be prompted to enter a new password for the root user. Please note that logging in as the root user is not recommended and can pose security risks.

## Logging in as Root User (Optional)

If you have set a root password and wish to log in as the root user, you can use the following command:

```bash
su - root
```

Enter the password you set for the root user when prompted. However, it's important to note that logging in as the root user is discouraged for security reasons.

## Step 2: Rebooting the System

After making any changes or updates to your system, it's a good practice to reboot to apply the changes. To reboot your system, run the following command:

```bash
sudo reboot
```

This command will initiate a system reboot. Make sure to save any unsaved work before proceeding.

After the system reboots, you will be ready to continue with the installation of Ubuntu Server.

Now that we have obtained root privileges and rebooted the system, we can proceed with the installation of Ubuntu Server.

## Installing Nala

In this section, we will cover how to install Nala, a tool that enhances package management and updates.

## Step 1: Installing Nala

Nala is a package manager and update tool that improves the performance and user experience of package management on Ubuntu. To install Nala, open a terminal and run the following commands:

```bash
echo "deb http://deb.volian.org/volian/ scar main" | sudo tee /etc/apt/sources.list.d/volian-archive-scar-unstable.list; wget -qO - https://deb.volian.org/volian/scar.key | sudo tee /etc/apt/trusted.gpg.d/volian-archive-scar-unstable.gpg
```

This command adds the Nala repository to your system's software sources.

```bash
sudo apt update && sudo apt install nala
```

This command updates the package lists and installs Nala on your system.

## Step 2: Speeding up Downloads with Nala

Nala significantly speeds up the download process by optimizing the package mirrors. To fetch the packages using Nala, run the following command:

```bash
sudo nala fetch
```

This command will fetch the packages using optimized mirrors, resulting in faster downloads.

## Step 3: Updating the System with Nala

Nala provides an improved way to update your system. To update your system using Nala, run the following command:

```bash
sudo nala update && sudo nala upgrade
```

This command updates the package lists and upgrades the installed packages to their latest versions.

## Step 4: Converting APT to Nala

To simplify the usage of Nala and make it compatible with APT commands, you can add the following lines to the `~/.bashrc` and `/root/.bashrc` files:

```bash
sudo nano ~/.bashrc
sudo nano /root/.bashrc
```

Add the following lines to the end of both files:

```bash
##### From here you can install programs with apt or nala command and it will always work perfectly!####
apt() { 
command nala "$@"
}
sudo() {
if [ "$1" = "apt" ]; then
 shift
 command sudo nala "$@"
else
 command sudo "$@"
fi
}
```

These lines define aliases for the `apt` and `sudo` commands, allowing you to use either command interchangeably with the same functionality.

Once you have made the changes, save the files and close the editor.

Now that we have installed Nala and configured it to work with APT commands, we can proceed with the installation of Ubuntu Server.

## Editing the needrestart.conf File

In this section, we will cover how to stop the "Daemons using outdated libraries" pop-up in Ubuntu.

## Step 1: Editing the needrestart.conf File

The "Daemons using outdated libraries" pop-up in Ubuntu 22.04 is caused by the needrestart command, which is part of the apt-get upgrade process. By default, needrestart is set to "interactive" mode, which interrupts scripts and prompts for user input.

To change this behavior and prevent the pop-up, we need to edit the needrestart.conf file. Open a terminal and run the following command:

```bash
sudo nano /etc/needrestart/needrestart.conf
```

This command opens the needrestart.conf file in the nano text editor.

## Step 2: Modifying the needrestart.conf File

Within the needrestart.conf file, locate the line that contains the following:

```bash
$nrconf{restart} = 'i';
```

This line defines the restart behavior of needrestart as "interactive" mode.

Replace the line with the following:

```bash
$nrconf{restart} = 'a';
```

This change sets the restart behavior to "automatic" mode, which will prevent the pop-up and automatically restart the necessary daemons when needed.

## Step 3: Saving the Changes

After making the necessary modifications to the needrestart.conf file, save the changes by pressing `Ctrl + O`, then press `Enter` to confirm the filename.

To exit the nano text editor, press `Ctrl + X`.

Now that we have modified the needrestart.conf file to change the restart behavior, the "Daemons using outdated libraries" pop-up should no longer interrupt scripts in Ubuntu.

Proceed with the installation of Ubuntu Server, knowing that you have resolved the issue with the pop-up notifications.

## Setting the time and configuring NTP

In this section, we will cover setting the time and configuring NTP (Network Time Protocol) for accurate time synchronization.

## Step 1: Checking and Setting the Timezone

To check your system's current timezone, you can use the `timedatectl` command. Open a terminal and run the following command:

```bash
timedatectl
```

This command will display detailed information about your system's date and time, including the timezone.

To narrow down the list of timezones to your region, you can use the `grep` command. For example, if you want to filter the timezones for the Americas, run the following command:

```bash
timedatectl list-timezones | grep America
```

Once you have identified the timezone you want to set for your Ubuntu server, you can use the `timedatectl` command to set it. For example, to set the timezone to "America/New_York," run the following command:

```bash
sudo timedatectl set-timezone America/New_York
```

## Step 2: Enabling NTP (Network Time Protocol)

NTP allows your server to synchronize its time with remote time servers, ensuring accurate timekeeping. To enable NTP, use the following command:

```bash
sudo timedatectl set-ntp on
```

This command enables the NTP service on your Ubuntu server.

If you need to install the `tzdata` package to get additional timezone data, you can do so by running the following command:

```bash
sudo apt install tzdata
```

## Step 3: Configuring systemd-timesyncd (optional)

Ubuntu utilizes the systemd-timesyncd daemon client to provide accurate time synchronization across networks. You can configure this daemon by modifying its configuration file.

Open the `systemd-timesyncd.conf` file in a text editor using the following command:

```bash
sudo nano /etc/systemd/timesyncd.conf
```

Within the file, add the closest geographically NTP servers to the NTP statement line. For example:

```markdown
[Time]
NTP=0.pool.ntp.org 1.pool.ntp.org 2.pool.ntp.org 3.pool.ntp.org
FallbackNTP=ntp.ubuntu.com
```

You can find your nearest geographically NTP servers by referring to the NTP pool project server list at <http://www.pool.ntp.org/en/>.

After modifying the configuration file, restart the systemd-timesyncd daemon to apply the changes:

```bash
sudo systemctl restart systemd-timesyncd.service
```

To check the status of the systemd-timesyncd daemon, use the following command:

```bash
sudo systemctl status systemd-timesyncd.service
```

This command will display the current status of the daemon.

By following these steps, you will ensure that your Ubuntu server's time is correctly set to your timezone and synchronized with accurate NTP servers.

## Disabling Snap

In this section, we will cover disabling Snap, a package management system, if desired.

## Step 1: Disable Snap

Snap packages can have some drawbacks, such as slower performance and the need for mounted filesystems. If you prefer not to use Snap, you can disable it using the following steps.

1. Open a terminal and list the Snap packages installed on your system by running the following command:

   ```bash
   snap list
   ```

2. Remove the Snap packages in the specified order. Replace the package names in the commands below based on the output of the previous command. Run these commands one by one:

   ```bash
   sudo snap remove --purge firefox
   sudo snap remove --purge snap-store
   sudo snap remove --purge gnome-3-38-2004
   sudo snap remove --purge gtk-common-themes
   sudo snap remove --purge snapd-desktop-integration
   sudo snap remove --purge bare
   sudo snap remove --purge lxd
   sudo snap remove --purge core20
   sudo snap remove --purge snapd
   ```

3. Finally, remove the Snap daemon using the apt command:

   ```bash
   sudo apt remove --autoremove snapd
   ```

## Step 2: Prevent Snap from Being Installed Again

To prevent Snap from being installed again when running the `sudo apt update` command, you can create an apt preference file.

1. Open a terminal and create a new preference file called `nosnap.pref` in the `/etc/apt/preferences.d/` directory:

   ```bash
   sudo nano /etc/apt/preferences.d/nosnap.pref
   ```

2. Add the following lines to the file and save it:

   ```bash
   Package: snapd
   Pin: release a=*
   Pin-Priority: -10
   ```

   These lines will prevent the installation of the `snapd` package.

3. After saving and closing the file, run the following command to update the apt repositories:

   ```bash
   sudo apt update
   ```

By following these steps, you can disable Snap and prevent it from being installed again on your Ubuntu server.

## Speeding up files and Memory

In this section, we will cover speeding up files and memory to optimize system performance.

## Step 1: Adjust System Settings

To improve file and memory speed, we need to modify certain system settings. Follow these steps to make the necessary changes:

1. Open the `/etc/sysctl.conf` file using the following command:

   ```bash
   sudo nano /etc/sysctl.conf
   ```

2. Add the following lines at the end of the file:

   ```bash
   fs.file-max=100000
   vm.overcommit_memory = 1
   ```

3. Save the file and exit the text editor.

4. Apply the changes by running the following command:

   ```bash
   sudo sysctl -p /etc/sysctl.conf
   ```

5. Open the `/etc/security/limits.conf` file:

   ```bash
   sudo nano /etc/security/limits.conf
   ```

6. Add the following lines at the end of the file:

   ```bash
   *               soft    nofile          1000000
   *               hard    nofile          1000000
   ```

7. Save the file and exit the text editor.

8. Open the `/etc/pam.d/common-session` file:

   ```bash
   sudo nano /etc/pam.d/common-session
   ```

9. Add the following line at the end of the file:

   ```bash
   session required        pam_limits.so
   ```

10. Save the file and exit the text editor.

## Step 2: Optimize System Performance with tuned-adm

The `tuned-adm` tool allows you to optimize system performance by applying specific tuning profiles. Follow these steps to install and use `tuned-adm`:

1. Update the package list and install `tuned` and related packages:

   ```bash
   sudo apt update && sudo apt install tuned tuned-utils tuned-utils-systemtap
   ```

2. Check the currently active tuning profile by running the following command:

   ```bash
   tuned-adm active
   ```

   Note down the currently active profile for reference.

3. List all available tuning profiles using the following command:

   ```bash
   tuned-adm list
   ```

4. Select a desired tuning profile, for example, `throughput-performance`, by running the following command:

   ```bash
   sudo tuned-adm profile throughput-performance
   ```

5. Reboot the system to apply the selected tuning profile:

   ```bash
   sudo reboot
   ```

By following these steps, you can adjust system settings and optimize performance by using `tuned-adm` on your Ubuntu server.

## How to Disable cloud-init

cloud-init is a tool used for initializing cloud instances and performing various setup tasks during the boot process. However, in some cases, you may want to disable cloud-init to prevent it from executing any actions on subsequent boots. This guide provides two methods to disable cloud-init.

## Method 1: Using a Text File

Follow these steps to disable cloud-init using a text file:

1. Open a terminal and create an empty file named `/etc/cloud/cloud-init.disabled` using the following command:

   ```bash
   sudo touch /etc/cloud/cloud-init.disabled
   ```

   This file acts as a flag that tells the operating system's init system not to start cloud-init during boot.

## Method 2: Modifying the Kernel Commandline

Follow these steps to disable cloud-init by modifying the kernel commandline:

1. Open a terminal and edit the GRUB configuration file using a text editor, such as nano:

   ```bash
   sudo nano /etc/default/grub
   ```

2. Append `cloud-init.disabled` to the `GRUB_CMDLINE_LINUX` variable. The line should look like this:

   ```bash
   GRUB_CMDLINE_LINUX="cloud-init.disabled"
   ```

3. Save the file and exit the text editor.

4. Regenerate the GRUB configuration file by running the following command:

   ```bash
   sudo grub-mkconfig -o /boot/efi/EFI/ubuntu/grub.cfg
   ```

   This command may vary depending on your specific distribution and bootloader configuration.

Note: When running in containers, cloud-init will read an environment variable named `KERNEL_CMDLINE` in place of the kernel commandline.

By following these methods, you can disable cloud-init on your Ubuntu server. Choose the method that suits your requirements and configuration.

## Install Cockpit on Ubuntu Server

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

## Install Docker and Docker Compose

Docker is a popular containerization platform that allows you to run applications in isolated environments called containers. Docker Compose is a tool that simplifies the management of multi-container Docker applications. This guide will walk you through the steps to install Docker and Docker Compose on Ubuntu Server.

## Step 1: Add Docker's Public GPG Key

To verify the packages received during installation, we need to add Docker's public GPG key.

1. Install the required packages by running the following command:

   ```bash
   sudo apt install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
   ```

2. Add the GPG key by executing the following commands:

   ```bash
   sudo mkdir -p /etc/apt/keyrings
   curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
   ```

## Step 2: Add Docker Repository

Next, we'll add the Docker repository to Ubuntu Server.

1. Run the following command to add the Docker repository:

   ```bash
   echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
   ```

## Step 3: Update the System

Now, update the system to rebuild the APT package index cache and recognize the newly added Docker repository.

```bash
sudo apt update
```

## Step 4: Install Docker and Docker Compose

We are now ready to install Docker and Docker Compose on Ubuntu Server.

1. Run the following command to install Docker and Docker Compose:

   ```bash
   sudo apt install docker-ce docker-ce-cli containerd.io docker-compose-plugin
   ```

   Note: This command will install Docker Engine, Docker CLI, and Docker Compose on your system.

2. Verify the installation by checking the Docker and Docker Compose versions:

   ```bash
   docker version
   docker compose version
   ```

## Step 5: Add User to Docker Group

To use Docker without using `sudo` (which can have security implications), add your user to the Docker group.

```bash
sudo usermod -aG docker $USER
```

After adding your user to the Docker group, log out and log back in for the changes to take effect.

## Step 6: Create Directory for Docker Data Storage

To store Docker data and enable easy data restoration, create a directory to serve as the storage location.

1. Create the directory by running the following command:

   ```bash
   sudo mkdir /home/docker
   ```

2. Modify the access permissions for the directory:

   ```bash
   sudo chmod -R 775 /home/docker
   ```

3. Change the ownership of the directory to your user:

   ```bash
   sudo chown -R yourname:yourname /home/docker
   ```

   Note: Replace `yourname` with your actual username.

4. Verify the permissions and ownership by running the following command:

   ```bash
   ls -l /home
   ```

   The output should show the ownership and permissions of the `/home/docker` directory.

Docker and Docker Compose are now installed on your Ubuntu Server. You can start using Docker to deploy and manage containerized applications.

## Install Portainer Docker UI Web Interface

Portainer is a web-based graphical user interface (UI) that allows you to manage Docker images and containers without using the command line. It provides an easy way to deploy, monitor, and manage containers, networks, and volumes. This guide will walk you through the steps to install Portainer on Ubuntu Server.

## Step 1: Create a Portainer Container

To install Portainer, run the following command to create a Docker container:

```bash
docker run -d -p 9000:9000 -p 9443:9443 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v /home/docker/portainer/portainer_data:/data portainer/portainer-ce
```

Explanation of the command and its options:

- `-d`: Runs the container as a daemon process.
- `-p 9000:9000`: Maps the host's port 9000 to the container's port 9000, allowing access to Portainer's web UI through the host.
- `-p 9443:9443`: Maps the host's port 9443 to the container's port 9443, allowing access to Portainer's web UI over SSL through the host.
- `--name portainer`: Gives the name "portainer" to the container.
- `--restart always`: Automatically restarts the container if it stops or crashes.
- `-v /var/run/docker.sock:/var/run/docker.sock`: Mounts the host's Docker socket in the container, enabling Portainer to communicate with the host's Docker daemon.
- `-v /home/docker/portainer/portainer_data:/data`: Specifies the location where Portainer will store its data. Adjust the path according to your preference.
- `portainer/portainer-ce`: Specifies the image name and tag to use, in this case, "portainer/portainer-ce," which is the official Portainer image from Docker Hub.

## Step 2: Verify the Portainer Container

To verify that the Portainer container is running, execute the following command:

```bash
sudo docker ps
```

You should see the Portainer container listed in the output, indicating that it is running.

### Step 3: Access the Portainer Web UI

You can now access the Portainer web UI by opening your web browser and visiting `http://<your_server_ip>:9000`. Replace `<your_server_ip>` with the IP address of your Ubuntu Server.

For example, if your server's IP address is `172.17.0.1`, you would access the Portainer web UI by visiting `http://172.17.0.1:9000`.

Congratulations! You have successfully installed Portainer on your Ubuntu Server. You can now use the web interface to manage your Docker containers, images, networks, and volumes.

## Understanding the Dynamic motd

The dynamic motd is constructed using files and scripts located in the `/etc/update-motd/` directory. It includes various system information and messages, including news from Canonical. By default, the motd fetches information from an online service provided by Canonical and updates every 12 hours.

## Disabling motd news

The motd news section includes updates and information from Canonical. If you prefer not to see this part, follow these steps:

1. Open the file `/etc/default/motd-news` using a text editor. For example:

   ```bash
   sudo nano /etc/default/motd-news
   ```

2. Look for the line `ENABLED=1` and change it to `ENABLED=0`.
3. Save the file and exit the text editor.

Now, the news part of the dynamic motd will be disabled.

## Disabling parts of the dynamic motd

The dynamic motd includes various scripts in the `/etc/update-motd.d/` directory. You can disable specific parts by removing the execute permission from the corresponding scripts. Here's how:

1. List the scripts in the `/etc/update-motd.d/` directory:

   ```bash
   ls /etc/update-motd.d/
   ```

2. Identify the scripts you want to disable. For example, `80-livepatch`, `51-cloudguest`, and `10-help-text`.
3. Remove the execute permission from the scripts using the `chmod` command. For example:

   ```bash
   sudo chmod -x /etc/update-motd.d/80-livepatch
   sudo chmod -x /etc/update-motd.d/51-cloudguest
   sudo chmod -x /etc/update-motd.d/10-help-text
   ```

Now, when you log in, the disabled scripts will no longer be shown in the dynamic motd.

## Disabling dynamic motd entirely

Disabling the entire dynamic motd can be a bit more involved. Here's one possible approach:

1. Open the `/etc/pam.d/login` file in a text editor. For example:

   ```bash
   sudo nano /etc/pam.d/login
   ```

2. Comment out the line that includes `pam_motd.so` by adding a `#` at the beginning. It should look like this:

   ```bash
   #session    optional     pam_motd.so  motd=/run/motd.dynamic
   ```

3. Repeat the same step for the `/etc/pam.d/sshd` file.
4. Optionally, you can create or modify the `/etc/motd` file to customize the message that will be displayed instead of the dynamic motd.

Please note that modifying the PAM configuration may have other effects on the system, so proceed with caution.

## Conclusion

Disabling specific parts or the entire dynamic motd can help customize your server's login experience. By following the steps outlined in this guide, you can tailor the motd to display only the information that is relevant to you and disable any unwanted features.
