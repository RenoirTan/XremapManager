systemddir = $(libdir)/systemd
dist_systemd_DATA = init/systemd/xremaprunner.service

init/systemd/xremaprunner.service: init/systemd/xremaprunner.service.in Makefile
	$(expand_dirvars) "$<" > "$@"

openrcdir = /etc/init.d
dist_openrc_DATA = init/openrc/xremaprunner

init/openrc/xremaprunner: init/openrc/xremaprunner.in Makefile
	$(expand_dirvars) "$<" > "$@"

dist_data_DATA = config/xremapmanager.json