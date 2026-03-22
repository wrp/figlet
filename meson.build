
project('figlet', 'c',
	version: run_command('git', 'describe', '--tags', '--always', '--dirty',
		check: true).stdout().strip())

add_project_arguments('-DVERSION="' + meson.project_version() + '"', language: ['c'])

version_int = meson.project_version().replace('.', '0')
add_project_arguments('-DVERSION_INT="' + version_int + '"', language: ['c'])

message('Numeric version: ' + version_int)


source_files = ['figlet.c', 'zipio.c', 'crc.c', 'inflate.c', 'utf8.c']
executable('figlet', sources : source_files)
