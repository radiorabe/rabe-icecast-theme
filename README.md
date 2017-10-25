# Initial deploy

Login to stream.rabe.ch as root.

	cd ~
	cd /usr/share/

Backup original configuration:

	mv icecast icecast.orig

Install templates from the git repository:

	git clone https://github.com/radiorabe/stream_web.git
	mv ~/stream_web /usr/share/icecast

Restore authentication configs from original files:

	mv icecast.orig/auth/ icecast/

Fix permissions for all files:

	find /usr/share/icecast -type d -exec chmod 755 {} \;
	find /usr/share/icecast -type f -exec chmod 644 {} \;

# Update templates from repository

Login to stream.rabe.ch as root:

	cd /usr/share/icecast
	git pull
	Already up-to-date.

## License

stream_web is released under the terms of the GNU Affero General Public License.
Copyright 2015-2017 Radio RaBe.
See `LICENSE` for further information.
