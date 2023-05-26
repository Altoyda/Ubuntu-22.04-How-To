# Disabling Snap

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

## [`Home`](Table_of_Contents.md) [`Next`](Files_and_Memory.md)
