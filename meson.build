
project('figlet', 'c',
	meson_version : '>= 1.3.0',
	default_options : ['warning_level=3'],
	version: run_command('git', 'describe', '--tags', '--always', '--dirty',
		check: true).stdout().strip()
)

add_project_arguments('-DVERSION="' + meson.project_version() + '"', language: ['c'])

version_int = meson.project_version().replace('.', '0')
add_project_arguments('-DVERSION_INT="' + version_int + '"', language: ['c'])
add_project_arguments('-DDEFAULTFONTDIR="' + get_option('prefix') + '/share/figlet"', language: ['c'])
add_project_arguments('-DDEFAULTFONTFILE="standard"', language: ['c'])


if meson.get_compiler('c').has_header('unistd.h')
	add_project_arguments('-DHAVE_UNISTD_H', language: ['c'])
endif

message('Numeric version: ' + version_int)

source_files = ['figlet.c', 'zipio.c', 'crc.c', 'inflate.c', 'utf8.c']
figlet = executable('figlet', sources: source_files, install: true)
executable('chkfont', sources: 'chkfont.c', install: true)
install_data('showfigfonts', 'showfigfonts', install_dir: 'bin')
install_data('figlist', 'figlist', install_dir: 'bin')

install_man('figlet.6', 'chkfont.6', 'figlist.6', 'showfigfonts.6')

test('run-test', files('run-tests.sh'),
	workdir: meson.project_source_root(),
	depends: figlet,
	env: [
		'FIGLET_FONTDIR=' + meson.project_source_root() + '/fonts',
		'CMD=' + meson.project_build_root() + '/figlet',
	],
)
