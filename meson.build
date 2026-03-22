
project('figlet', 'c',
	version: run_command('git', 'describe', '--tags', '--always', '--dirty',
		check: true).stdout().strip())
source_files = ['figlet.c', 'zipio.c', 'crc.c', 'inflate.c', 'utf8.c']
executable('figlet', sources : source_files)
