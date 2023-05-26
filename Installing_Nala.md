# Installing Nala

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

## [`Home`](Table_of_Contents.md) [`Next`](Editing_The_Needrestart.md)
