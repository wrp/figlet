
.PHONY: all
all: builddir
	meson compile -C builddir $${V+--verbose}

builddir:
	meson setup builddir

.PHONY: install
install: builddir
	meson install -C builddir

.PHONY: check
check: builddir
	meson test -C builddir


clean:
	rm -rf builddir
