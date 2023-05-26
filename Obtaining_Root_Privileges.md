# Setting a Root Password (Optional)

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

## [`Home`](Table_of_Contents.md) [`Next`](Installing_Nala.md)
