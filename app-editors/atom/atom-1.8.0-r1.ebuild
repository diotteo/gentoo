# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python2_7 )
inherit flag-o-matic python-any-r1 eutils multiprocessing rpm

DESCRIPTION="A hackable text editor for the 21st Century"
HOMEPAGE="https://atom.io"
MY_PV="${PV//_/-}"

ELECTRON_SLOT=0.36

# All binary packages depend on this
NAN_V=2.0.9

# Keep dep versions in sync with atom/package.json
CACHED_RUN_IN_THIS_CONTEXT_V=0.4.1
GIT_UTILS_V=4.1.2
NODEGIT_V=0.12.2
NODE_NSLOG_V=3.0.0
NODE_ONIGURUMA_V=5.1.2
NODE_PATHWATCHER_V=6.2.4
NODE_RUNAS_V=3.1.1
SCROLLBAR_STYLE_V=3.2.0
SPELL_CHECK_V=0.67.0

# textbuffer dependency
MARKER_INDEX_V=3.1.0

# apm dependency
NODE_KEYTAR_V=3.0.2

# atom-keymap dependency
KEYBOARD_LAYOUT_V=1.0.0

# symbols-view dependency
NODE_CTAGS_V=3.0.0

# spell-check dependency
NODE_SPELLCHECKER_V=3.2.3

# nodegit dependencies
PROMISIFY_NODE_V=0.4.0
NODE_FS_EXTRA_V=0.26.2
NODE_GRACEFUL_FS_V=4.1.2
NODE_JSONFILE_V=2.1.0
NODE_KLAW_V=1.0.0
RIMRAF_V=2.2.8
NODE_LODASH_V=3.10.1
COMBYNE_V=0.8.1
JS_BEAUTIFY_V=1.5.10
NODEGIT_PROMISE_V=4.0.0
ASAP_V=2.0.3
OBJECT_ASSIGN_V=4.0.1

ASAR_V=0.12.1

# The x86_64 arch below is irrelevant, as we will rebuild all binary packages.
SRC_URI="
	https://github.com/${PN}/${PN}/releases/download/v${MY_PV}/atom.x86_64.rpm -> atom-${MY_PV}.rpm
	https://github.com/elprans/asar/releases/download/v${ASAR_V}-gentoo/asar-build.tar.gz -> asar-${ASAR_V}.tar.gz
	https://github.com/nodejs/nan/archive/v${NAN_V}.tar.gz -> nodejs-nan-${NAN_V}.tar.gz
	https://github.com/atom/cached-run-in-this-context/archive/v${CACHED_RUN_IN_THIS_CONTEXT_V}.tar.gz -> atom-cached-run-in-this-context-${CACHED_RUN_IN_THIS_CONTEXT_V}.tar.gz
	https://github.com/atom/node-ctags/archive/v${NODE_CTAGS_V}.tar.gz -> atom-node-ctags-${NODE_CTAGS_V}.tar.gz
	https://github.com/atom/git-utils/archive/v${GIT_UTILS_V}.tar.gz -> atom-git-utils-${GIT_UTILS_V}.tar.gz
	https://github.com/nodegit/nodegit/archive/v${NODEGIT_V}.tar.gz -> nodegit-${NODEGIT_V}.tar.gz
	https://github.com/atom/keyboard-layout/archive/v${KEYBOARD_LAYOUT_V}.tar.gz -> atom-keyboard-layout-${KEYBOARD_LAYOUT_V}.tar.gz
	https://github.com/atom/marker-index/archive/v${MARKER_INDEX_V}.tar.gz -> atom-marker-index-${MARKER_INDEX_V}.tar.gz
	https://github.com/atom/node-keytar/archive/v${NODE_KEYTAR_V}.tar.gz -> atom-node-keytar-${NODE_KEYTAR_V}.tar.gz
	https://github.com/atom/node-nslog/archive/v${NODE_NSLOG_V}.tar.gz -> atom-node-nslog-${NODE_NSLOG_V}.tar.gz
	https://github.com/atom/node-oniguruma/archive/v${NODE_ONIGURUMA_V}.tar.gz -> atom-node-oniguruma-${NODE_ONIGURUMA_V}.tar.gz
	https://github.com/atom/node-pathwatcher/archive/v${NODE_PATHWATCHER_V}.tar.gz -> atom-node-pathwatcher-${NODE_PATHWATCHER_V}.tar.gz
	https://github.com/atom/node-runas/archive/v${NODE_RUNAS_V}.tar.gz -> atom-node-runas-${NODE_RUNAS_V}.tar.gz
	https://github.com/atom/scrollbar-style/archive/v${SCROLLBAR_STYLE_V}.tar.gz -> atom-scrollbar-style-${SCROLLBAR_STYLE_V}.tar.gz
	https://github.com/atom/node-spellchecker/archive/v${NODE_SPELLCHECKER_V}.tar.gz -> atom-node-spellchecker-${NODE_SPELLCHECKER_V}.tar.gz

	https://github.com/nodegit/promisify-node/archive/${PROMISIFY_NODE_V}.tar.gz -> nodegit-promisify-node-${PROMISIFY_NODE_V}.tar.gz
	https://registry.npmjs.org/nodegit-promise/-/nodegit-promise-${NODEGIT_PROMISE_V}.tgz
	https://registry.npmjs.org/lodash/-/lodash-${NODE_LODASH_V}.tgz -> node-lodash-${NODE_LODASH_V}.tgz
	https://github.com/kriskowal/asap/archive/v${ASAP_V}.tar.gz -> node-asap-${ASAP_V}.tar.gz
	https://github.com/sindresorhus/object-assign/archive/v${OBJECT_ASSIGN_V}.tar.gz -> node-object-assign-${OBJECT_ASSIGN_V}.tar.gz
	https://github.com/jprichardson/node-fs-extra/archive/${NODE_FS_EXTRA_V}.tar.gz -> node-fs-extra-${NODE_FS_EXTRA_V}.tar.gz
	https://github.com/jprichardson/node-jsonfile/archive/${NODE_JSONFILE_V}.tar.gz -> node-jsonfile-${NODE_JSONFILE_V}.tar.gz
	https://github.com/jprichardson/node-klaw/archive/${NODE_KLAW_V}.tar.gz -> node-klaw-${NODE_KLAW_V}.tar.gz
	https://github.com/isaacs/node-graceful-fs/archive/v${NODE_GRACEFUL_FS_V}.tar.gz -> node-graceful-fs-${NODE_GRACEFUL_FS_V}.tar.gz
	https://github.com/isaacs/rimraf/archive/v${RIMRAF_V}.tar.gz -> node-rimraf-${RIMRAF_V}.tar.gz
	https://github.com/tbranyen/combyne/archive/${COMBYNE_V}.tar.gz -> node-combyne-${COMBYNE_V}.tar.gz
	https://github.com/beautify-web/js-beautify/archive/v${JS_BEAUTIFY_V}.tar.gz -> node-js-beautify-${JS_BEAUTIFY_V}.tar.gz
"

BINMODS="
		cached-run-in-this-context
		node-ctags
		git-utils
		nodegit
		keyboard-layout
		node-nslog
		node-oniguruma
		node-pathwatcher
		node-runas
		node-keytar
		scrollbar-style
		node-spellchecker
		marker-index
"

RESTRICT="mirror"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	!dev-util/apm
	${PYTHON_DEPS}
	>=app-text/hunspell-1.3.3:=
	=dev-libs/libgit2-0.23*:=[ssh]
	>=gnome-base/libgnome-keyring-3.12:=
	>=dev-libs/oniguruma-5.9.5:=
	>=dev-util/ctags-5.8
	>=dev-util/electron-0.36.12-r3:${ELECTRON_SLOT}
"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}-${MY_PV}"

pkg_setup() {
	python-any-r1_pkg_setup
}

get_install_suffix() {
	local c=(${SLOT//\// })
	local slot=${c[0]}
	local suffix

	if [[ "${slot}" == "0" ]]; then
		suffix=""
	else
		suffix="-${slot}"
	fi

	echo -n "${suffix}"
}

get_install_dir() {
	echo -n "/usr/$(get_libdir)/atom$(get_install_suffix)"
}

get_electron_dir() {
	echo -n "/usr/$(get_libdir)/electron-${ELECTRON_SLOT}"
}

get_electron_nodedir() {
	echo -n "/usr/include/electron-${ELECTRON_SLOT}/node/"
}

enode_electron() {
	"$(get_electron_dir)"/node $@
}

enodegyp_atom() {
	local apmpath="/usr/share/atom/resources/app/apm"
	local nodegyp="${S}/${apmpath}/node_modules/npm/node_modules/node-gyp/bin/node-gyp.js"

	PATH="$(get_electron_dir):${PATH}" \
		enode_electron "${nodegyp}" \
			--nodedir="$(get_electron_nodedir)" $@ || die
}

easar() {
	local asar="${WORKDIR}/$(package_dir asar)/node_modules/asar/bin/asar"
	echo "asar" $@
	enode_electron "${asar}" $@ || die
}

package_dir() {
	local binmod="${1}" binmod_v
	eval binmod_v=\${$(tr '[:lower:]' '[:upper:]' <<< ${binmod//-/_}_V)}
	echo -n ${binmod}-${binmod_v}
}

_unpack_npm_package() {
	local a="${1}" basename suffix

	basename=${a%.*}
	suffix=${basename##*.}
	if [[ "${suffix}" == "tar" ]]; then
		basename=${basename%.*}
	fi

	unpack ${a}
	mv package "${basename}" || die
}

_have_patches_for() {
	local _patches="${1}-*.patch" _find
	_find=$(find "${FILESDIR}" -maxdepth 1 -name "${_patches}" -print -quit)
	test -n "$_find"
}

src_unpack() {
	local a

	for a in ${A} ; do
		case ${a} in
		*.rpm) srcrpm_unpack "${a}" ;;
		nodegit-promise*|node-lodash*) _unpack_npm_package "${a}" ;;
		*) unpack "${a}" ;;
		esac
	done

	mkdir "${WORKDIR}/atom-${MY_PV}" || die
	mv "${WORKDIR}/usr" "${WORKDIR}/atom-${MY_PV}" || die
}

src_prepare() {
	local install_dir="$(get_install_dir)"
	local suffix="$(get_install_suffix)"
	local patch binmod _s nan_s="${WORKDIR}/nan-${NAN_V}"

	cd "${S}/usr/share/atom/resources/app" || die
	epatch "${FILESDIR}/${PN}-python.patch"
	epatch "${FILESDIR}/${PN}-unbundle-electron.patch"

	sed -i -e "s|{{NPM_CONFIG_NODEDIR}}|$(get_electron_nodedir)|g" \
		./atom.sh \
		|| die

	sed -i -e "s|{{ATOM_PATH}}|$(get_electron_dir)/electron|g" \
		./atom.sh \
		|| die

	sed -i -e "s|{{ATOM_RESOURCE_PATH}}|${install_dir}/app.asar|g" \
		./atom.sh \
		|| die

	local env="export NPM_CONFIG_NODEDIR=$(get_electron_nodedir)"
	sed -i -e \
		"s|\"\$binDir/\$nodeBin\" --harmony_collections|${env}\nexec $(get_electron_dir)/node|g" \
			apm/bin/apm || die

	sed -i -e \
		"s|^\([[:space:]]*\)node[[:space:]]\+|\1\"$(get_electron_dir)/node\" |g" \
			apm/node_modules/npm/bin/node-gyp-bin/node-gyp || die

	rm apm/bin/node || die

	sed -i -e "s|/usr/share/atom/atom|/usr/bin/atom|g" \
		"${S}/usr/share/applications/atom.desktop" || die

	cd "${S}" || die

	for binmod in ${BINMODS}; do
		_s="${WORKDIR}/$(package_dir ${binmod})"
		cd "${_s}" || die
		if _have_patches_for "${binmod}"; then
			for patch in "${FILESDIR}"/${binmod}-*.patch; do
				epatch "${patch}"
			done
		fi
	done

	# Unbundle bundled libs from modules

	_s="${WORKDIR}/$(package_dir git-utils)"
	${EPYTHON} "${FILESDIR}/gyp-unbundle.py" \
		--inplace --unbundle "git;libgit2;git2" "${_s}/binding.gyp" || die

	_s="${WORKDIR}/$(package_dir node-oniguruma)"
	${EPYTHON} "${FILESDIR}/gyp-unbundle.py" \
		--inplace --unbundle "onig_scanner;oniguruma;onig" "${_s}/binding.gyp" || die

	_s="${WORKDIR}/$(package_dir node-spellchecker)"
	${EPYTHON} "${FILESDIR}/gyp-unbundle.py" \
		--inplace --unbundle "spellchecker;hunspell;hunspell" "${_s}/binding.gyp" || die

	for binmod in ${BINMODS}; do
		_s="${WORKDIR}/$(package_dir ${binmod})"
		mkdir -p "${_s}/node_modules" || die
		ln -s "${nan_s}" "${_s}/node_modules/nan" || die
	done

	_s="${WORKDIR}/$(package_dir nodegit)"
	ln -s "${WORKDIR}/$(package_dir node-fs-extra)" "${_s}/node_modules/fs-extra" || die
	ln -s "${WORKDIR}/$(package_dir promisify-node)" "${_s}/node_modules/promisify-node" || die
	ln -s "${WORKDIR}/$(package_dir combyne)" "${_s}/node_modules/combyne" || die
	ln -s "${WORKDIR}/$(package_dir js-beautify)" "${_s}/node_modules/js-beautify" || die
	ln -s "${WORKDIR}/$(package_dir node-lodash)" "${_s}/node_modules/lodash" || die

	_s="${WORKDIR}/$(package_dir promisify-node)"
	mkdir "${_s}/node_modules" || die
	ln -s "${WORKDIR}/$(package_dir nodegit-promise)" "${_s}/node_modules/nodegit-promise" || die
	ln -s "${WORKDIR}/$(package_dir object-assign)" "${_s}/node_modules/object-assign" || die

	_s="${WORKDIR}/$(package_dir nodegit-promise)"
	mkdir "${_s}/node_modules" || die
	ln -s "${WORKDIR}/$(package_dir asap)" "${_s}/node_modules/asap" || die

	_s="${WORKDIR}/$(package_dir node-fs-extra)"
	mkdir "${_s}/node_modules" || die
	ln -s "${WORKDIR}/$(package_dir node-graceful-fs)" "${_s}/node_modules/graceful-fs" || die
	ln -s "${WORKDIR}/$(package_dir node-jsonfile)" "${_s}/node_modules/jsonfile" || die
	ln -s "${WORKDIR}/$(package_dir node-klaw)" "${_s}/node_modules/klaw" || die
	ln -s "${WORKDIR}/$(package_dir rimraf)" "${_s}/node_modules/rimraf" || die

	# Unpack app.asar
	easar extract "${S}/usr/share/atom/resources/app.asar" "${S}/build/app"

	cd "${S}" || die

	epatch "${FILESDIR}/atom-apm-path.patch"
	epatch "${FILESDIR}/asar-require.patch"

	sed -i -e "s|{{ATOM_SUFFIX}}|${suffix}|g" \
		"${S}/build/app/src/config-schema.js" || die

	eapply_user
}

src_configure() {
	local binmod _s

	_s="${WORKDIR}/$(package_dir nodegit)"
	cd "${_s}" || die
	enode_electron generate/scripts/generateJson.js || die
	enode_electron generate/scripts/generateNativeCode.js || die

	${EPYTHON} "${FILESDIR}/gyp-unbundle.py" \
		--inplace --unbundle "nodegit;vendor/libgit2.gyp:libgit2;git2;ssh2" "${_s}/binding.gyp" || die

	for binmod in ${BINMODS}; do
		einfo "Configuring ${binmod}..."
		_s="${WORKDIR}/$(package_dir ${binmod})"
		cd "${_s}" || die
		enodegyp_atom configure
	done
}

src_compile() {
	local binmod _s x
	local ctags_d="node_modules/symbols-view/vendor"
	local jobs=$(makeopts_jobs) gypopts

	gypopts="--verbose"

	if [[ ${MAKEOPTS} == *-j* && ${jobs} != 999 ]]; then
		gypopts+=" --jobs ${jobs}"
	fi

	mkdir -p "${S}/build/modules/" || die

	for binmod in ${BINMODS}; do
		einfo "Building ${binmod}..."
		_s="${WORKDIR}/$(package_dir ${binmod})"
		cd "${_s}" || die
		enodegyp_atom ${gypopts} build
		x=${binmod##node-}
		mkdir -p "${S}/build/modules/${x}"
		cp build/Release/*.node "${S}/build/modules/${x}"
	done

	# Put compiled binary modules in place
	_fix_binmods "${S}/build" "app"
	_fix_binmods "${S}/usr/share/atom/resources" "app"

	# Remove non-Linux vendored ctags binaries
	rm "${S}/build/app/${ctags_d}/ctags-darwin" \
	   "${S}/build/app/${ctags_d}/ctags-win32.exe" || die

	# Re-pack app.asar
	# Keep unpack rules in sync with build/tasks/generate-asar-task.coffee
	cd "${S}/build" || die
	x="--unpack={*.node,ctags-config,ctags-linux,**/node_modules/spellchecker/**,**/resources/atom.png}"
	easar pack "${x}" "app" "app.asar"
	cd "${S}" || die
}

_fix_binmods() {
	local _dir="${2}" _prefix="${1}" path relpath modpath mod depth link f d
	local cruft

	find "${_prefix}/${_dir}" -name '*.node' -print | while IFS= read -r path; do
		f=$(basename "${path}")
		d=$(dirname "${path}")
	    relpath=${path#${_prefix}}
		relpath=${relpath##/}
		relpath=${relpath#W${_dir}}
		modpath=$(dirname ${relpath})
		modpath=${modpath%build/Release}
		mod=$(basename ${modpath})

		# must copy here as symlinks will cause the module loading to fail
		cp -f "${S}/build/modules/${mod}/${f}" "${path}" || die
		cruft=$(find "${d}" -name '*.a' -print)
		if [ -n "${cruft}" ]; then
			rm ${cruft} || die
		fi
	done
}

_fix_executables() {
	local _dir="${1}" _node_sb="#!$(get_electron_dir)"/node

	(find -L "${ED}/${_dir}" -maxdepth 1 -mindepth 1 -type f -print || die) \
	| while IFS= read -r f; do
		IFS= read -r shebang < "${f}"

		if [[ ${shebang} == '#!'* ]]; then
			fperms +x "${f#${ED}}"
			if [[ "${shebang}" == "#!/usr/bin/env node" || "${shebang}" == "#!/usr/bin/node" ]]; then
				einfo "Fixing node shebang in ${f#${ED}}"
				sed --follow-symlinks -i \
					-e "1s:${shebang}$:${_node_sb}:" "${f}" || die
			fi
		fi
	done || die
}

src_install() {
	local install_dir="$(get_install_dir)"
	local suffix="$(get_install_suffix)"
	local ctags_d="node_modules/symbols-view/vendor"

	cd "${S}" || die

	# Replace vendored ctags with a symlink to system ctags
	rm "${S}/build/app.asar.unpacked/${ctags_d}/ctags-linux" || die
	ln -s "/usr/bin/ctags" \
		"${S}/build/app.asar.unpacked/${ctags_d}/ctags-linux" || die

	insinto "${install_dir}"

	doins build/app.asar
	doins -r build/app.asar.unpacked
	doins -r usr/share/atom/resources/app

	insinto /usr/share/applications/
	newins usr/share/applications/atom.desktop "atom${suffix}.desktop"

	insinto /usr/share/icons/
	doins -r usr/share/icons/hicolor

	exeinto "${install_dir}"
	newexe usr/share/atom/resources/app/atom.sh atom
	insinto /usr/share/licenses/"${PN}${suffix}"
	doins usr/share/atom/resources/LICENSE.md
	dosym "${install_dir}/atom" "/usr/bin/atom${suffix}"
	dosym "${install_dir}/app/apm/bin/apm" "/usr/bin/apm${suffix}"

	_fix_executables "${install_dir}/app/apm/bin"
	_fix_executables "${install_dir}/app/apm/node_modules/.bin"
	_fix_executables "${install_dir}/app/apm/node_modules/npm/bin"
	_fix_executables "${install_dir}/app/apm/node_modules/npm/bin/node-gyp-bin"
	_fix_executables "${install_dir}/app/apm/node_modules/node-gyp/bin"
}
