test:
	typst-test run

lib:
	typst compile lib.typ --open

LIBDIR=${HOME}/Library/Application Support/typst/packages/tychetellstales/pho
link:
	mkdir -p "${LIBDIR}"
	test -d "${LIBDIR}/0.0.1" || ln -s "`pwd`" "${LIBDIR}/0.0.1"
