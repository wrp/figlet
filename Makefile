
.PHONY: all
all: builddir/build.ninja
	meson compile -C builddir $${V+--verbose}

builddir/build.ninja:
	meson setup builddir

.PHONY: install
install: builddir/build.ninja
	meson install -C builddir

.PHONY: check
check: builddir/build.ninja
	meson test -C builddir

.PHONY: clean
clean:
	rm -rf builddir
