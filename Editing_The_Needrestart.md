# Editing the needrestart.conf File

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

## [`Home`](Table_of_Contents.md) [`Next`](Time_and_NTP.md)
