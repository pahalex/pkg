R=/opt/cisco/package/sr
SR=$(DESTDIR)$(R)

install: install-venv

install-venv:
	mkdir -p $(SR)
	virtualenv $(SR)/vpfa
	. $(SR)/vpfa/bin/activate && easy_install twisted && deactivate
	virtualenv --relocatable $(SR)/vpfa
	sed 's:$(DESTDIR)::' -i $(SR)/vpfa/bin/activate*

