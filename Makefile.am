if USE_NLS
PO_SUBDIR = po
endif

SUBDIRS = $(PO_SUBDIR) mate-user-guide

desktopdir = $(datadir)/applications
desktop_in_files = mate-user-guide.desktop.in
desktop_DATA = $(desktop_in_files:.desktop.in=.desktop)

$(desktop_DATA): $(desktop_in_files)
if USE_NLS
	$(AM_V_GEN) $(MSGFMT) --desktop --template $< -d $(top_srcdir)/po -o $@
else
	$(AM_V_GEN) cp $< $@
endif

CLEANFILES = $(desktop_DATA)

EXTRA_DIST = \
    autogen.sh

# Build ChangeLog from GIT  history
ChangeLog:
	$(AM_V_GEN) if test -d $(top_srcdir)/.git; then \
		GIT_DIR="$(top_srcdir)/.git" git log --stat > $@; \
	fi

dist: ChangeLog

.PHONY: ChangeLog
