################################################################################
# Makefile - Makefile for installing rabe-icecast-theme
################################################################################
#
# Copyright (C) 2017 Radio Bern RaBe
#                    Switzerland
#                    http://www.rabe.ch
#
# This program is free software: you can redistribute it and/or
# modify it under the terms of the GNU Affero General Public 
# License as published  by the Free Software Foundation, version
# 3 of the License.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public
# License  along with this program.
# If not, see <http://www.gnu.org/licenses/>.
#
# Please submit enhancements, bugfixes or comments via:
# https://github.com/radiorabe/rabe-icecast-theme
#
# Authors:
#  Christian Affolter <c.affolter@purplehaze.ch>

PN = rabe-icecast-theme

# Standard commands according to
# https://www.gnu.org/software/make/manual/html_node/Makefile-Conventions.html
SHELL = /bin/sh
INSTALL = /usr/bin/install
INSTALL_PROGRAM = $(INSTALL)
INSTALL_DATA = $(INSTALL) -m 644

# Standard directories according to
# https://www.gnu.org/software/make/manual/html_node/Directory-Variables.html#Directory-Variables
prefix = /usr/local
exec_prefix = $(prefix)
bindir = $(exec_prefix)/bin
datarootdir = $(prefix)/share
datadir = $(datarootdir)
docdir = $(datarootdir)/doc/$(PN)
sbindir = $(exec_prefix)/sbin
sysconfdir = $(prefix)/etc
libdir = $(exec_prefix)/lib

.PHONY: all
all:


.PHONY: installdirs
installdirs:
	$(INSTALL) -d $(DESTDIR)$(datadir)/$(PN)/admin \
		      $(DESTDIR)$(datadir)/$(PN)/web \
		      $(DESTDIR)$(docdir)


.PHONY: install
install: all installdirs
	$(INSTALL_DATA) admin/* $(DESTDIR)$(datadir)/$(PN)/admin
	$(INSTALL_DATA) web/* $(DESTDIR)$(datadir)/$(PN)/web
	$(INSTALL_DATA) README.md $(DESTDIR)$(docdir)/


.PHONY: uninstall
uninstall:
	rm -rf $(DESTDIR)$(datadir)/$(PN)/
	rm -rf $(DESTDIR)$(docdir)/
