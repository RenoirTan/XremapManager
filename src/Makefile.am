# https://blog.kevin-brown.com/programming/2014/09/24/combining-autotools-and-setuptools.html

pyproject.toml: pyproject.toml.in Makefile
	$(expand_dirvars) "$<" > "$@"

xremapmanager/_data.py: xremapmanager/_data.py.in Makefile
	$(expand_dirvars) "$<" > "$@"

all-local: pyproject.toml Makefile
	(cd $(srcdir)/src; python -m poetry build)

wheel_name=@PROJECT_NAME@-@PROJECT_VERSION@-py3-none-any.whl

install-exec-local:
	(cd $(srcdir)/src; python -m poetry run python -m installer \
		--destdir "$(DESTDIR)" \
		--prefix "$(prefix)" \
		dist/$(wheel_name))
