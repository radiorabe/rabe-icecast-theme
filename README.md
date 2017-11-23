# Radio Bern RaBe Icecast web theme
[Icecast](http://icecast.org/) streaming server web layout (CSS, HTML and
images) for [Radio Bern RaBe](http://www.rabe.ch) based on the original Icecast
layout.


## Installation via RPM on CentOS
The RaBe Icecast web theme is packaged for CentOS 7 and available on [Radio
RaBe's Audio Packages for Enterprise Linux
repository](https://build.opensuse.org/project/show/home:radiorabe:audio). It
can be installed as follows:

```bash
# Install the RaBe APEL repository configuration
curl -o /etc/yum.repos.d/home:radiorabe:audio.repo \
     http://download.opensuse.org/repositories/home:/radiorabe:/audio/CentOS_7/home:radiorabe:audio.repo

# Install the package
yum install rabe-icecast-theme
```

[Configure the Icecast server](#icecast-configuration) to use the new theme.


## Manual installation
For all other distributions you can manually install the RaBe Icecast web theme
via Git (make sure you have `git` installed):

```bash
# Install the web theme from the git repository:
cd /usr/local/share
git clone https://github.com/radiorabe/rabe-icecast-theme.git

# To update the web theme
cd /usr/local/share/rabe-icecast-theme
git pull
```

[Configure the Icecast server](#icecast-configuration) to use the new theme.

## Icecast configuration
The Icecast server must be configured to use the newly installed web theme.
Edit the Icecast configuration XML and point the `webroot` and `adminroot` to
the new theme directories:
```bash
vi /etc/icecast.xml
```

```xml
<icecast>
    <!-- [...] -->
    <paths>
        <!-- [...] -->
        <webroot>/usr/share/rabe-icecast-theme/web</webroot>
        <adminroot>/usr/share/rabe-icecast-theme/admin</adminroot>
        <!-- [...] -->
    </paths>
    <!-- [...] -->
</icecast>
```

Adapt the paths above to `/usr/local/share/rabe-icecast-theme` for manual
installations.

Or the same changes via sed:
```bash
sed -i \
    -e 's|^\([[:space:]]*<webroot>\).*\(</webroot>\)|\1/usr/share/rabe-icecast-theme/web\2|' \
    -e 's|^\([[:space:]]*<adminroot>\).*\(</adminroot>\)|\1/usr/share/rabe-icecast-theme/admin\2|' \
    /etc/icecast.xml
```

Finally, restart the Icecast server and enjoy the new RaBe theme :-)

```bash
systemctl restart icecast.service
```

## License
rabe-icecast-theme is free software: you can redistribute it and/or modify it
under the terms of the GNU Affero General Public License as published by the
Free Software Foundation, version 3 of the License.

## Copyright
Copyright (c) 2017 [Radio Bern RaBe](http://www.rabe.ch)
