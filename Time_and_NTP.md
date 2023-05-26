# Setting the time and configuring NTP

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

## [`Home`](Table_of_Contents.md) [`Next`](Disabling_Snap.md)
