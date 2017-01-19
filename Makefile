

NAME=aserver
VER=1.0

ROOT=/opt/$(NAME)
VENV=$(NAME)
ETC=/etc/$(NAME)

SR=$(DESTDIR)$(ROOT)
BUILD=build

all: aserver-dist

install: install-venv install-etc install-svc

clean:
	rm -rf dist *.egg-info $(NAME)-$(VER).tar.gz $(BUILD)

rpm-src:
	mkdir -p $(BUILD)
	ln -sfn $(PWD) $(BUILD)/$(NAME)-$(VER)
	tar -C $(BUILD) -z -c -f $(NAME)-$(VER).tar.gz \
		$(NAME)-$(VER)/Makefile \
		$(NAME)-$(VER)/setup.py \
		$(NAME)-$(VER)/$(NAME)

$(BUILD):
	mkdir -p $@

aserver-dist: $(BUILD)
	ln -sfn src/$(NAME)
	python setup.py sdist

install-venv:
	mkdir -p -m755 $(SR)
	virtualenv $(SR)/$(VENV)
	. $(SR)/$(VENV)/bin/activate && easy_install dist/aserver-*.tar.gz && deactivate
	virtualenv --relocatable $(SR)/$(VENV)
	sed 's:$(DESTDIR)::' -i $(SR)/$(VENV)/bin/activate*

install-etc:
	echo "sample" > config
	mkdir -p -m755 $(ETC)
	install -p -m 644 config $(ETC)
	
install-svc:
	
