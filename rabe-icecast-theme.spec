#
# spec file for package rabe-icecast-theme
#
# Copyright (c) 2017 Radio Bern RaBe
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
# Please submit enhancements, bugfixes or comments via GitHub:
# https://github.com/radiorabe/rabe-icecast-theme
#

Name:           rabe-icecast-theme
Version:        0.1.0
Release:        1%{?dist}
Summary:        Radio Bern RaBe Icecast web theme

License:        AGPL
BuildArch:      noarch
URL:            https://github.com/radiorabe/%{name}
Source0:        https://github.com/radiorabe/%{name}/archive/v%{version}.tar.gz#/%{name}-%{version}.tar.gz


%description
Icecast streaming server web layout (CSS, HTML and images) for Radio Bern RaBe.


%prep
%setup -q -n %{name}-%{version}


%build


%install
make install prefix=%{_prefix} \
             exec_prefix=%{_exec_prefix} \
             datarootdir=%{_datarootdir} \
             datadir=%{_datadir} \
             docdir=%{_docdir}/%{name} \
             DESTDIR=%{?buildroot}


%files
%doc %{_docdir}/%{name}/README.md
%{_datadir}/%{name}/*


%changelog
* Thu Nov 23 2017 Christian Affolter <c.affolter@purplehaze.ch> - 0.1.0-1
- Initial release
