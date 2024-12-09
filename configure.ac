AC_INIT([xremapmanager], [0.1.0])
AM_INIT_AUTOMAKE([foreign -Wall -Werror])
PROJECT_NAME=xremapmanager
PROJECT_VERSION=0.1.0
AC_SUBST([PROJECT_NAME])
AC_SUBST([PROJECT_VERSION])
AM_CONDITIONAL([USE_SYSTEMD], [test x$INIT_SYSTEM = xsystemd])
AM_CONDITIONAL([USE_OPENRC], [test x$INIT_SYSTEM = xopenrc])
AC_CONFIG_FILES([Makefile src/Makefile res/Makefile])
AC_OUTPUT