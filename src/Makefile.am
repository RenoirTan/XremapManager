dist_bin_SCRIPTS = xrmp-runner

xrmp-runner: xrmp-runner.in Makefile
	$(expand_dirvars) "$<" > "$@"

# https://blog.kevin-brown.com/programming/2014/09/24/combining-autotools-and-setuptools.html

all-local:
	(cd $(srcdir)/src; python -m poetry build)

wheel_name=@PROJECT_NAME@-@PROJECT_VERSION@-py3-none-any.whl

install-exec-local:
	(cd $(srcdir)/src; python -m poetry run python -m installer \
		--destdir "$(DESTDIR)" \
		--prefix "$(prefix)" \
		dist/$(wheel_name))
