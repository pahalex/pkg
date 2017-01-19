Name:           vpfa
Version:        2.0
Release:        1%{?dist}
Summary:        The "Hello World" program from GNU

Source0:	vpfa-2.0.tgz
License:        GPLv3+

BuildRequires:  gcc python-devel python-setuptools python-virtualenv libffi-devel openssl-devel make
Requires:       python

%description
The "Hello World" program, done with all bells and whistles of a proper FOSS 
project, including configuration, build, internationalization, help files, etc.


%prep
%setup -q


%build


%install
rm -rf $RPM_BUILD_ROOT
%make_install


%files
/opt/cisco/package/sr/vpfa


%changelog
