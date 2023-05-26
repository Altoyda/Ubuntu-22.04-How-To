# How to Install Ubuntu Server

## Introduction

Ubuntu Server is a powerful and versatile operating system that can be used for a wide range of server applications. This guide will walk you through the step-by-step process of installing Ubuntu Server on your system. We will begin by adding the Universe and Multiverse repositories and then update the system to ensure we have the latest updates.

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

## [`Home`](Table_of_Contents.md) [`Next`](Obtaining_Root_Privileges.md)
