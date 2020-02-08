AC_INIT([mate-user-guide], [1.24.0], [https://github.com/mate-desktop/mate-user-guide/issues/new])
AM_INIT_AUTOMAKE([1.11 dist-xz no-dist-gzip])
AM_SILENT_RULES([yes])

YELP_HELP_INIT

AM_MAINTAINER_MODE([enable])

GETTEXT_PACKAGE="mate-user-guide"
AC_DEFINE_UNQUOTED(GETTEXT_PACKAGE, "$GETTEXT_PACKAGE", [The gettext translation domain])
AC_SUBST(GETTEXT_PACKAGE)
AM_GNU_GETTEXT_VERSION([0.19.8])
AM_GNU_GETTEXT_REQUIRE_VERSION([0.19.8])
AM_GNU_GETTEXT([external])

AC_OUTPUT([
Makefile
mate-user-guide.desktop.in
po/Makefile.in
mate-user-guide/Makefile
])

