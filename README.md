# Asustor SMART info

<a href="https://github.com/007revad/Asustor_SMART_info/releases"><img src="https://img.shields.io/github/release/007revad/Asustor_SMART_info.svg"></a>
![Badge](https://hitscounter.dev/api/hit?url=https%3A%2F%2Fgithub.com%2F007revad%2FAsustor_SMART_info&label=Visitors&icon=github&color=%23198754&message=&style=flat&tz=Australia%2FSydney)
[![Donate](https://img.shields.io/badge/Donate-PayPal-green.svg)](https://www.paypal.com/paypalme/007revad)
[![](https://img.shields.io/static/v1?label=Sponsor&message=%E2%9D%A4&logo=GitHub&color=%23fe8e86)](https://github.com/sponsors/007revad)
<!--- [![committers.top badge](https://user-badge.committers.top/australia/007revad.svg)](https://user-badge.committers.top/australia/007revad) --->

### Description

Show Asustor drive's smart health and attributes. Can also email you when important values change.

The script works in ADM 5 and ADM 4.

### Requirements

This script needs bash installed in ADM. The easiest way to install bash is to install the Netdata app in App Central as it includes bash.

<p align="center">Install Netdata app</p>
<p align="center"><img src="/images/install_netdata.png"></p>

<p align="center">Leave Enable port fowarding UNTICKED</p>
<p align="center"><img src="/images/leave_unticked.png"></p>

### Download the script

1. Download the latest version _Source code (zip)_ from https://github.com/007revad/Asustor_SMART_info/releases
2. Save the download zip file to a folder on the Asustory.
3. Unzip the zip file.

### Options when running the script <a name="options"></a>

There are optional flags you can use when running the script:
```YAML
  -a, --all             Show all SMART attributes
  -e, --email           Disable colored text in output scheduler emails
  -i, --increased       Only show important attributes that have increased
  -u, --update          Update the script to the latest version
  -h, --help            Show this help message
  -v, --version         Show the script version
```

### To run the script via SSH

[How to enable SSH in ADM](https://www.asustor.com/en/online/online_help?id=24)

```YAML
sudo -s /volume1/scripts/asustor_smart_info.sh
```

> **Note** <br>
> Replace /volume1/scripts/ with the path to where the script is located.

To see all the SMART attributes run the script with the `-a` or `--all` option:

```bash
sudo -s /volume1/scripts/asustor_smart_info.sh --all
```

> **Note** <br>
> The script automatically shows all SMART attributes for any drives that don't return "SMART test passed".

To see only important SMART attributes that have changed since you last ran the script run the script with the `-i` or `--increased` option:

```bash
sudo -s /volume1/scripts/asustor_smart_info.sh -i
```

### To run the script via task scheduler

See [How to run from task scheduler](https://github.com/007revad/Asustor_SMART_info/blob/main/how_to_run_from_scheduler.md)

<p align="center">Sample email when a driive's important SMART attributes have changed</p>
<p align="center"><img src="/images/email.png"></p>

### Troubleshooting

If the script won't run check the following:

1. Make sure you download the zip file and unzipped it to a folder on your Asustor (not on your computer).
2. If the path to the script contains any spaces you need to enclose the path/scriptname in double quotes:
   ```YAML
   sudo -s "/volume1/my scripts/asustor_smart_info.sh"
   ```
3. Make sure you unpacked the zip or rar file that you downloaded and are trying to run the asustor_smart_info.sh file.
4. Set the script file as executable:
   ```YAML
   sudo chmod +x "/volume1/scripts/asustor_smart_info.sh"
   ```

### Screenshots

<p align="center">HDD, USB SSD and NVMe drive</p>
<p align="center"><img src="/images/nimbustor_gen2.png"></p>

<br>

<p align="center">Drives with issues</p>
<p align="center"><img src="/images/nimbustor.png"></p>
