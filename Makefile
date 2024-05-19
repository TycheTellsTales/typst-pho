VERSION:=$(shell grep version typst.toml | cut -d= -f2 | sed 's/[ "]//g')

test:
	typst-test run

lib:
	typst compile lib.typ --open

watch:
	typst watch lib.typ --open

LIBDIR=${HOME}/Library/Application Support/typst/packages/tychetellstales/pho
link:
	mkdir -p "${LIBDIR}"
	test -d "${LIBDIR}/${VERSION}" || ln -s "`pwd`" "${LIBDIR}/${VERSION}"

version:
	echo ${VERSION}
