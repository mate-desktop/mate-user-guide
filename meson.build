project(
  'mate-user-guide',
  meson_version: '>= 0.61.2',
  version: '1.28.0',
)

gnome = import('gnome')
i18n = import('i18n')

if get_option('nls')
  subdir('po')
endif

desktop_in = configure_file(
  input: 'mate-user-guide.desktop.in.in',
  output: 'mate-user-guide.desktop.in',
  copy: true,
)

i18n.merge_file(
  input: desktop_in,
  output: 'mate-user-guide.desktop',
  type: 'desktop',
  po_dir: join_paths(meson.project_source_root(), 'po'),
  install: true,
  install_dir: join_paths(get_option('datadir'), 'applications'),
)

subdir('mate-user-guide')
