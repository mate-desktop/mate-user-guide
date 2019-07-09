AC_INIT([mate-user-guide], [1.23.1], [https://github.com/mate-desktop/mate-user-guide/issues/new])
AM_INIT_AUTOMAKE([1.11 dist-xz no-dist-gzip])
AM_SILENT_RULES([yes])

YELP_HELP_INIT

IT_PROG_INTLTOOL([0.40.0])

AM_MAINTAINER_MODE([enable])

GETTEXT_PACKAGE="mate-user-guide"
AC_DEFINE_UNQUOTED(GETTEXT_PACKAGE, "$GETTEXT_PACKAGE", [The gettext translation domain])
AC_SUBST(GETTEXT_PACKAGE)

AM_GLIB_GNU_GETTEXT

AC_OUTPUT([
Makefile
mate-user-guide.desktop.in
po/Makefile.in
mate-user-guide/Makefile
])

