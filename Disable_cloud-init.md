# How to Disable cloud-init

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

## [`Home`](Table_of_Contents.md) [`Next`](Cockpit.md)
