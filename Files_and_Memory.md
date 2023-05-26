# Speeding up files and Memory

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

## [`Home`](Table_of_Contents.md) [`Next`](Disable_cloud-init.md)
