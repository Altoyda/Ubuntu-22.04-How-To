# Understanding the Dynamic motd

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

## [`Home`](Table_of_Contents.md)
