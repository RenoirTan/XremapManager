export expand_dirvars = sed \
	-e 's|[@]PROJECT_NAME@|@PROJECT_NAME@|g' \
	-e 's|[@]PROJECT_VERSION@|@PROJECT_VERSION@|g' \
	-e 's|[@]prefix@|$(prefix)|g' \
	-e 's|[@]exec_prefix@|$(exec_prefix)|g' \
	-e 's|[@]bindir@|$(bindir)|g' \
	-e 's|[@]datadir@|$(datadir)|g'

SUBDIRS = src res