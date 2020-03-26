
# ALL options.
#
option(RETDEC_DOC "Build public API documentation (requires Doxygen)." OFF)
option(RETDEC_TESTS "Build tests." OFF)
option(RETDEC_DEV_TOOLS "Build dev tools." OFF)
option(RETDEC_FORCE_OPENSSL_BUILD "Force OpenSSL build." OFF)
option(RETDEC_COMPILE_YARA "Compile YARA rules at installation." ON)

# Component options.
#
option(RETDEC_ENABLE_AR_EXTRACTOR "" OFF)
option(RETDEC_ENABLE_AR_EXTRACTORTOOL "" OFF)
option(RETDEC_ENABLE_BIN2LLVMIR "" OFF)
option(RETDEC_ENABLE_BIN2LLVMIRTOOL "" OFF)
option(RETDEC_ENABLE_BIN2PAT "" OFF)
option(RETDEC_ENABLE_CAPSTONE2LLVMIR "" OFF)
option(RETDEC_ENABLE_CAPSTONE2LLVMIRTOOL "" OFF)
option(RETDEC_ENABLE_COMMON "" OFF)
option(RETDEC_ENABLE_CONFIG "" OFF)
option(RETDEC_ENABLE_CONFIGTOOL "" OFF)
option(RETDEC_ENABLE_CPDETECT "" OFF)
option(RETDEC_ENABLE_CRYPTO "" OFF)
option(RETDEC_ENABLE_CTYPES "" OFF)
option(RETDEC_ENABLE_CTYPESPARSER "" OFF)
option(RETDEC_ENABLE_DEBUGFORMAT "" OFF)
option(RETDEC_ENABLE_DEMANGLER "" OFF)
option(RETDEC_ENABLE_DEMANGLERTOOL "" OFF)
option(RETDEC_ENABLE_FILEFORMAT "" OFF)
option(RETDEC_ENABLE_FILEINFO "" OFF)
option(RETDEC_ENABLE_GETSIG "" OFF)
option(RETDEC_ENABLE_IDR2PAT "" OFF)
option(RETDEC_ENABLE_LLVM_SUPPORT "" OFF)
option(RETDEC_ENABLE_LLVMIR_EMUL "" OFF)
option(RETDEC_ENABLE_LLVMIR2HLL "" OFF)
option(RETDEC_ENABLE_LLVMIR2HLLTOOL "" OFF)
option(RETDEC_ENABLE_LOADER "" OFF)
option(RETDEC_ENABLE_MACHO_EXTRACTOR "" OFF)
option(RETDEC_ENABLE_MACHO_EXTRACTORTOOL "" OFF)
option(RETDEC_ENABLE_PAT2YARA "" OFF)
option(RETDEC_ENABLE_PATTERNGEN "" OFF)
option(RETDEC_ENABLE_PDBPARSER "" OFF)
option(RETDEC_ENABLE_PELIB "" OFF)
option(RETDEC_ENABLE_RETDEC "" OFF)
option(RETDEC_ENABLE_RETDECTOOL "" OFF)
option(RETDEC_ENABLE_RTTI_FINDER "" OFF)
option(RETDEC_ENABLE_SERDES "" OFF)
option(RETDEC_ENABLE_STACOFIN "" OFF)
option(RETDEC_ENABLE_STACOFINTOOL "" OFF)
option(RETDEC_ENABLE_UNPACKER "" OFF)
option(RETDEC_ENABLE_UNPACKERTOOL "" OFF)
option(RETDEC_ENABLE_UTILS "" OFF)
option(RETDEC_ENABLE_YARACPP "" OFF)

# Dependency options.
#
include(${PROJECT_SOURCE_DIR}/cmake/deps.cmake)

# Default: ALL build is enabled.
#
set(RETDEC_ENABLE_ALL ON)

# Convert target list in RETDEC_ENABLE to RETDEC_ENABLE_<component> flags.
#
macro(set_if_equal v string res)
	if(${v} STREQUAL ${string})
		set(${res} ON)
	endif()
endmacro()
string(REPLACE "," ";" RETDEC_ENABLE "${RETDEC_ENABLE}")
foreach(t ${RETDEC_ENABLE})
	set_if_equal(${t} "ar-extractor" RETDEC_ENABLE_AR_EXTRACTOR)
	set_if_equal(${t} "ar-extractortool" RETDEC_ENABLE_AR_EXTRACTORTOOL)
	set_if_equal(${t} "bin2llvmir" RETDEC_ENABLE_BIN2LLVMIR)
	set_if_equal(${t} "bin2llvmirtool" RETDEC_ENABLE_BIN2LLVMIRTOOL)
	set_if_equal(${t} "bin2pat" RETDEC_ENABLE_BIN2PAT)
	set_if_equal(${t} "capstone2llvmir" RETDEC_ENABLE_CAPSTONE2LLVMIR)
	set_if_equal(${t} "capstone2llvmirtool" RETDEC_ENABLE_CAPSTONE2LLVMIRTOOL)
	set_if_equal(${t} "common" RETDEC_ENABLE_COMMON)
	set_if_equal(${t} "config" RETDEC_ENABLE_CONFIG)
	set_if_equal(${t} "configtool" RETDEC_ENABLE_CONFIGTOOL)
	set_if_equal(${t} "cpdetect" RETDEC_ENABLE_CPDETECT)
	set_if_equal(${t} "crypto" RETDEC_ENABLE_CRYPTO)
	set_if_equal(${t} "ctypes" RETDEC_ENABLE_CTYPES)
	set_if_equal(${t} "ctypesparser" RETDEC_ENABLE_CTYPESPARSER)
	set_if_equal(${t} "debugformat" RETDEC_ENABLE_DEBUGFORMAT)
	set_if_equal(${t} "demangler" RETDEC_ENABLE_DEMANGLER)
	set_if_equal(${t} "demanglertool" RETDEC_ENABLE_DEMANGLERTOOL)
	set_if_equal(${t} "fileformat" RETDEC_ENABLE_FILEFORMAT)
	set_if_equal(${t} "fileinfo" RETDEC_ENABLE_FILEINFO)
	set_if_equal(${t} "getsig" RETDEC_ENABLE_GETSIG)
	set_if_equal(${t} "idr2pat" RETDEC_ENABLE_IDR2PAT)
	set_if_equal(${t} "llvm-support" RETDEC_ENABLE_LLVM_SUPPORT)
	set_if_equal(${t} "llvmir-emul" RETDEC_ENABLE_LLVMIR_EMUL)
	set_if_equal(${t} "llvmir2hll" RETDEC_ENABLE_LLVMIR2HLL)
	set_if_equal(${t} "llvmir2hlltool" RETDEC_ENABLE_LLVMIR2HLLTOOL)
	set_if_equal(${t} "loader" RETDEC_ENABLE_LOADER)
	set_if_equal(${t} "extractor" RETDEC_ENABLE_MACHO_EXTRACTOR)
	set_if_equal(${t} "extractortool" RETDEC_ENABLE_MACHO_EXTRACTORTOOL)
	set_if_equal(${t} "pat2yara" RETDEC_ENABLE_PAT2YARA)
	set_if_equal(${t} "patterngen" RETDEC_ENABLE_PATTERNGEN)
	set_if_equal(${t} "pdbparser" RETDEC_ENABLE_PDBPARSER)
	set_if_equal(${t} "pelib" RETDEC_ENABLE_PELIB)
	set_if_equal(${t} "retdec" RETDEC_ENABLE_RETDEC)
	set_if_equal(${t} "retdectool" RETDEC_ENABLE_RETDEC)
	set_if_equal(${t} "rtti-finder" RETDEC_ENABLE_RTTI_FINDER)
	set_if_equal(${t} "serdes" RETDEC_ENABLE_SERDES)
	set_if_equal(${t} "stacofin" RETDEC_ENABLE_STACOFIN)
	set_if_equal(${t} "stacofintool" RETDEC_ENABLE_STACOFINTOOL)
	set_if_equal(${t} "unpacker" RETDEC_ENABLE_UNPACKER)
	set_if_equal(${t} "unpackertool" RETDEC_ENABLE_UNPACKERTOOL)
	set_if_equal(${t} "utils" RETDEC_ENABLE_UTILS)
	set_if_equal(${t} "yaracpp" RETDEC_ENABLE_YARACPP)
endforeach()

# If at least one RETDEC_ENABLE_<component> is set, disable RETDEC_ENABLE_ALL.
#
if (RETDEC_ENABLE_AR_EXTRACTOR
	OR RETDEC_ENABLE_AR_EXTRACTORTOOL
	OR RETDEC_ENABLE_BIN2LLVMIR
	OR RETDEC_ENABLE_BIN2LLVMIRTOOL
	OR RETDEC_ENABLE_BIN2PAT
	OR RETDEC_ENABLE_CAPSTONE2LLVMIR
	OR RETDEC_ENABLE_CAPSTONE2LLVMIRTOOL
	OR RETDEC_ENABLE_COMMON
	OR RETDEC_ENABLE_CONFIG
	OR RETDEC_ENABLE_CONFIGTOOL
	OR RETDEC_ENABLE_CPDETECT
	OR RETDEC_ENABLE_CRYPTO
	OR RETDEC_ENABLE_CTYPES
	OR RETDEC_ENABLE_CTYPESPARSER
	OR RETDEC_ENABLE_DEBUGFORMAT
	OR RETDEC_ENABLE_DEMANGLER
	OR RETDEC_ENABLE_DEMANGLERTOOL
	OR RETDEC_ENABLE_FILEFORMAT
	OR RETDEC_ENABLE_FILEINFO
	OR RETDEC_ENABLE_GETSIG
	OR RETDEC_ENABLE_IDR2PAT
	OR RETDEC_ENABLE_LLVM_SUPPORT
	OR RETDEC_ENABLE_LLVMIR_EMUL
	OR RETDEC_ENABLE_LLVMIR2HLL
	OR RETDEC_ENABLE_LLVMIR2HLLTOOL
	OR RETDEC_ENABLE_LOADER
	OR RETDEC_ENABLE_MACHO_EXTRACTOR
	OR RETDEC_ENABLE_MACHO_EXTRACTORTOOL
	OR RETDEC_ENABLE_PAT2YARA
	OR RETDEC_ENABLE_PATTERNGEN
	OR RETDEC_ENABLE_PDBPARSER
	OR RETDEC_ENABLE_PELIB
	OR RETDEC_ENABLE_RETDEC
	OR RETDEC_ENABLE_RETDECTOOL
	OR RETDEC_ENABLE_RTTI_FINDER
	OR RETDEC_ENABLE_SERDES
	OR RETDEC_ENABLE_STACOFIN
	OR RETDEC_ENABLE_STACOFINTOOL
	OR RETDEC_ENABLE_UNPACKER
	OR RETDEC_ENABLE_UNPACKERTOOL
	OR RETDEC_ENABLE_UTILS
	OR RETDEC_ENABLE_YARACPP)
	set(RETDEC_ENABLE_ALL OFF)
endif()

# Enable chosen components.
# Whenever a component is directly using another component, it must be noted
# in here.
#
macro(set_if_at_least_one_set res)
	foreach(v ${ARGN})
		if(${${v}})
			set(${res} ON)
			break()
		endif()
	endforeach()
endmacro()

macro(set_if_all_set res)
	set(r ON)
	foreach(v ${ARGN})
		if(NOT ${${v}})
			set(r OFF)
			break()
		endif()
	endforeach()
	set(${res} ${r})
endmacro()

# scripts
set_if_at_least_one_set(RETDEC_ENABLE_SCRIPTS RETDEC_ENABLE_ALL)

# support
set_if_at_least_one_set(RETDEC_ENABLE_SUPPORT RETDEC_ENABLE_ALL)

# src

# Executables - targets are not used anywhere.
set_if_at_least_one_set(RETDEC_ENABLE_AR_EXTRACTORTOOL
		RETDEC_ENABLE_ALL)

set_if_at_least_one_set(RETDEC_ENABLE_BIN2LLVMIRTOOL
		RETDEC_ENABLE_ALL)

set_if_at_least_one_set(RETDEC_ENABLE_BIN2PAT
		RETDEC_ENABLE_ALL)

if(RETDEC_DEV_TOOLS)
	set_if_at_least_one_set(RETDEC_ENABLE_CAPSTONE2LLVMIRTOOL
			RETDEC_ENABLE_ALL)
endif()

set_if_at_least_one_set(RETDEC_ENABLE_CONFIGTOOL
		RETDEC_ENABLE_ALL)

if(RETDEC_DEV_TOOLS)
	set_if_at_least_one_set(RETDEC_ENABLE_DEMANGLERTOOL
			RETDEC_ENABLE_ALL)
endif()

set_if_at_least_one_set(RETDEC_ENABLE_FILEINFO
		RETDEC_ENABLE_ALL)

set_if_at_least_one_set(RETDEC_ENABLE_GETSIG
		RETDEC_ENABLE_ALL)

set_if_at_least_one_set(RETDEC_ENABLE_IDR2PAT
		RETDEC_ENABLE_ALL)

set_if_at_least_one_set(RETDEC_ENABLE_LLVMIR2HLLTOOL
		RETDEC_ENABLE_ALL)

set_if_at_least_one_set(RETDEC_ENABLE_MACHO_EXTRACTORTOOL
		RETDEC_ENABLE_ALL)

set_if_at_least_one_set(RETDEC_ENABLE_PAT2YARA
		RETDEC_ENABLE_ALL)

set_if_at_least_one_set(RETDEC_ENABLE_RETDECTOOL
		RETDEC_ENABLE_ALL)

set_if_at_least_one_set(RETDEC_ENABLE_STACOFINTOOL
		RETDEC_ENABLE_ALL)

set_if_at_least_one_set(RETDEC_ENABLE_UNPACKERTOOL
		RETDEC_ENABLE_ALL)

# Libraries - order matters.
set_if_at_least_one_set(RETDEC_ENABLE_RETDEC
		RETDEC_ENABLE_RETDECTOOL
		RETDEC_ENABLE_ALL)

set_if_at_least_one_set(RETDEC_ENABLE_MACHO_EXTRACTOR
		RETDEC_ENABLE_ALL
		RETDEC_ENABLE_MACHO_EXTRACTORTOOL)

set_if_at_least_one_set(RETDEC_ENABLE_AR_EXTRACTOR
		RETDEC_ENABLE_ALL
		RETDEC_ENABLE_AR_EXTRACTORTOOL
		RETDEC_ENABLE_FILEINFO)

set_if_at_least_one_set(RETDEC_ENABLE_BIN2LLVMIR
		RETDEC_ENABLE_ALL
		RETDEC_ENABLE_BIN2LLVMIRTOOL
		RETDEC_ENABLE_RETDEC)

set_if_at_least_one_set(RETDEC_ENABLE_LLVMIR2HLL
		RETDEC_ENABLE_ALL
		RETDEC_ENABLE_LLVMIR2HLLTOOL)

set_if_at_least_one_set(RETDEC_ENABLE_UNPACKER
		RETDEC_ENABLE_ALL
		RETDEC_ENABLE_UNPACKERTOOL)

set_if_at_least_one_set(RETDEC_ENABLE_PATTERNGEN
		RETDEC_ENABLE_ALL
		RETDEC_ENABLE_BIN2PAT
		RETDEC_ENABLE_PAT2YARA)

set_if_at_least_one_set(RETDEC_ENABLE_CAPSTONE2LLVMIR
		RETDEC_ENABLE_ALL
		RETDEC_ENABLE_BIN2LLVMIR
		RETDEC_ENABLE_CAPSTONE2LLVMIRTOOL)

set_if_at_least_one_set(RETDEC_ENABLE_STACOFIN
		RETDEC_ENABLE_ALL
		RETDEC_ENABLE_BIN2LLVMIR
		RETDEC_ENABLE_STACOFINTOOL)

set_if_at_least_one_set(RETDEC_ENABLE_CPDETECT
		RETDEC_ENABLE_ALL
		RETDEC_ENABLE_FILEINFO
		RETDEC_ENABLE_UNPACKERTOOL)

set_if_at_least_one_set(RETDEC_ENABLE_RTTI_FINDER
		RETDEC_ENABLE_ALL
		RETDEC_ENABLE_BIN2LLVMIR)

set_if_at_least_one_set(RETDEC_ENABLE_DEBUGFORMAT
		RETDEC_ENABLE_ALL
		RETDEC_ENABLE_BIN2LLVMIR)

set_if_at_least_one_set(RETDEC_ENABLE_DEMANGLER
		RETDEC_ENABLE_ALL
		RETDEC_ENABLE_BIN2LLVMIR
		RETDEC_ENABLE_DEBUGFORMAT
		RETDEC_ENABLE_DEMANGLERTOOL)

set_if_at_least_one_set(RETDEC_ENABLE_CTYPESPARSER
		RETDEC_ENABLE_ALL
		RETDEC_ENABLE_BIN2LLVMIR
		RETDEC_ENABLE_DEMANGLER)

set_if_at_least_one_set(RETDEC_ENABLE_CTYPES
		RETDEC_ENABLE_ALL
		RETDEC_ENABLE_CTYPESPARSER)

set_if_at_least_one_set(RETDEC_ENABLE_PDBPARSER
		RETDEC_ENABLE_DEBUGFORMAT)

set_if_at_least_one_set(RETDEC_ENABLE_LOADER
		RETDEC_ENABLE_ALL
		RETDEC_ENABLE_BIN2LLVMIR
		RETDEC_ENABLE_FILEINFO
		RETDEC_ENABLE_RTTI_FINDER
		RETDEC_ENABLE_STACOFIN
		RETDEC_ENABLE_STACOFINTOOL
		RETDEC_ENABLE_UNPACKER
		RETDEC_ENABLE_UNPACKERTOOL)

set_if_at_least_one_set(RETDEC_ENABLE_FILEFORMAT
		RETDEC_ENABLE_ALL
		RETDEC_ENABLE_BIN2LLVMIR
		RETDEC_ENABLE_CPDETECT
		RETDEC_ENABLE_FILEINFO
		RETDEC_ENABLE_GETSIG
		RETDEC_ENABLE_LOADER
		RETDEC_ENABLE_PATTERNGEN
		RETDEC_ENABLE_UNPACKERTOOL)

set_if_at_least_one_set(RETDEC_ENABLE_PELIB
		RETDEC_ENABLE_FILEFORMAT
		RETDEC_ENABLE_UNPACKERTOOL)

set_if_at_least_one_set(RETDEC_ENABLE_CRYPTO
		RETDEC_ENABLE_ALL
		RETDEC_ENABLE_FILEFORMAT)

set_if_at_least_one_set(RETDEC_ENABLE_LLVM_SUPPORT
		RETDEC_ENABLE_ALL
		RETDEC_ENABLE_BIN2LLVMIR
		RETDEC_ENABLE_LLVMIR2HLL)

set_if_at_least_one_set(RETDEC_ENABLE_CONFIG
		RETDEC_ENABLE_ALL
		RETDEC_ENABLE_BIN2LLVMIR
		RETDEC_ENABLE_CONFIGTOOL
		RETDEC_ENABLE_DEBUGFORMAT
		RETDEC_ENABLE_FILEINFO
		RETDEC_ENABLE_LLVMIR2HLL
		RETDEC_ENABLE_STACOFIN)

set_if_at_least_one_set(RETDEC_ENABLE_SERDES
		RETDEC_ENABLE_ALL
		RETDEC_ENABLE_CONFIG)

set_if_at_least_one_set(RETDEC_ENABLE_COMMON
		RETDEC_ENABLE_ALL
		RETDEC_ENABLE_BIN2LLVMIR
		RETDEC_ENABLE_CAPSTONE2LLVMIR
		RETDEC_ENABLE_CONFIG
		RETDEC_ENABLE_DEBUGFORMAT
		RETDEC_ENABLE_FILEFORMAT
		RETDEC_ENABLE_LOADER
		RETDEC_ENABLE_RTTI_FINDER
		RETDEC_ENABLE_SERDES
		RETDEC_ENABLE_STACOFIN)

set_if_at_least_one_set(RETDEC_ENABLE_UTILS
		RETDEC_ENABLE_ALL
		RETDEC_ENABLE_AR_EXTRACTOR
		RETDEC_ENABLE_AR_EXTRACTORTOOL
		RETDEC_ENABLE_BIN2LLVMIR
		RETDEC_ENABLE_BIN2PAT
		RETDEC_ENABLE_CAPSTONE2LLVMIRTOOL
		RETDEC_ENABLE_CONFIG
		RETDEC_ENABLE_COMMON
		RETDEC_ENABLE_CRYPTO
		RETDEC_ENABLE_CTYPES
		RETDEC_ENABLE_CTYPESPARSER
		RETDEC_ENABLE_FILEFORMAT
		RETDEC_ENABLE_FILEINFO
		RETDEC_ENABLE_IDR2PAT
		RETDEC_ENABLE_LLVM_SUPPORT
		RETDEC_ENABLE_LLVMIR2HLL
		RETDEC_ENABLE_LOADER
		RETDEC_ENABLE_MACHO_EXTRACTOR
		RETDEC_ENABLE_MACHO_EXTRACTORTOOL
		RETDEC_ENABLE_CPDETECT
		RETDEC_ENABLE_PATTERNGEN
		RETDEC_ENABLE_RTTI_FINDER
		RETDEC_ENABLE_STACOFIN
		RETDEC_ENABLE_UNPACKERTOOL)

set_if_at_least_one_set(RETDEC_ENABLE_YARACPP
		RETDEC_ENABLE_ALL
		RETDEC_ENABLE_CPDETECT
		RETDEC_ENABLE_FILEINFO
		RETDEC_ENABLE_STACOFIN)

# tests
set_if_all_set(RETDEC_ENABLE_BIN2LLVMIR_TESTS
		RETDEC_TESTS
		RETDEC_ENABLE_BIN2LLVMIR)
set_if_all_set(RETDEC_ENABLE_CAPSTONE2LLVMIR_TESTS
		RETDEC_TESTS
		RETDEC_ENABLE_CAPSTONE2LLVMIR)
set_if_all_set(RETDEC_ENABLE_CONFIG_TESTS
		RETDEC_TESTS
		RETDEC_ENABLE_CONFIG)
set_if_all_set(RETDEC_ENABLE_CTYPES_TESTS
		RETDEC_TESTS
		RETDEC_ENABLE_CTYPES)
set_if_all_set(RETDEC_ENABLE_CTYPESPARSER_TESTS
		RETDEC_TESTS
		RETDEC_ENABLE_CTYPESPARSER)
set_if_all_set(RETDEC_ENABLE_DEMANGLER_TESTS
		RETDEC_TESTS
		RETDEC_ENABLE_DEMANGLER)
set_if_all_set(RETDEC_ENABLE_FILEFORMAT_TESTS
		RETDEC_TESTS
		RETDEC_ENABLE_FILEFORMAT)
set_if_all_set(RETDEC_ENABLE_LLVMIR_EMUL_TESTS
		RETDEC_TESTS
		RETDEC_ENABLE_LLVMIR_EMUL)
set_if_all_set(RETDEC_ENABLE_LLVMIR2HLL_TESTS
		RETDEC_TESTS
		RETDEC_ENABLE_LLVMIR2HLL)
set_if_all_set(RETDEC_ENABLE_LOADER_TESTS
		RETDEC_TESTS
		RETDEC_ENABLE_LOADER)
set_if_all_set(RETDEC_ENABLE_SERDES_TESTS
		RETDEC_TESTS
		RETDEC_ENABLE_SERDES)
set_if_all_set(RETDEC_ENABLE_UNPACKER_TESTS
		RETDEC_TESTS
		RETDEC_ENABLE_UNPACKER)
set_if_all_set(RETDEC_ENABLE_COMMON_TESTS
		RETDEC_TESTS
		RETDEC_ENABLE_COMMON)
set_if_all_set(RETDEC_ENABLE_UTILS_TESTS
		RETDEC_TESTS
		RETDEC_ENABLE_UTILS)

# src depending on tests
set_if_at_least_one_set(RETDEC_ENABLE_LLVMIR_EMUL
		RETDEC_ENABLE_CAPSTONE2LLVMIR_TESTS)

# deps
set_if_at_least_one_set(RETDEC_ENABLE_CAPSTONE
		RETDEC_ENABLE_CAPSTONE2LLVMIR
		RETDEC_ENABLE_STACOFIN)

set_if_at_least_one_set(RETDEC_ENABLE_ELFIO
		RETDEC_ENABLE_FILEFORMAT)

set_if_at_least_one_set(RETDEC_ENABLE_GOOGLETEST
		RETDEC_ENABLE_BIN2LLVMIR_TESTS
		RETDEC_ENABLE_CAPSTONE2LLVMIR_TESTS
		RETDEC_ENABLE_COMMON_TESTS
		RETDEC_ENABLE_CONFIG_TESTS
		RETDEC_ENABLE_CTYPES_TESTS
		RETDEC_ENABLE_CTYPESPARSER_TESTS
		RETDEC_ENABLE_DEMANGLER_TESTS
		RETDEC_ENABLE_FILEFORMAT_TESTS
		RETDEC_ENABLE_LLVMIR_EMUL_TESTS
		RETDEC_ENABLE_LLVMIR2HLL_TESTS
		RETDEC_ENABLE_LOADER_TESTS
		RETDEC_ENABLE_SERDES_TESTS
		RETDEC_ENABLE_UNPACKER_TESTS
		RETDEC_ENABLE_UTILS_TESTS)

set_if_at_least_one_set(RETDEC_ENABLE_KEYSTONE
		RETDEC_ENABLE_CAPSTONE2LLVMIRTOOL
		RETDEC_ENABLE_CAPSTONE2LLVMIR_TESTS)

set_if_at_least_one_set(RETDEC_ENABLE_LLVM
		RETDEC_ENABLE_AR_EXTRACTOR
		RETDEC_ENABLE_BIN2LLVMIR
		RETDEC_ENABLE_CAPSTONE2LLVMIR
		RETDEC_ENABLE_DEMANGLER
		RETDEC_ENABLE_FILEFORMAT
		RETDEC_ENABLE_LLVM_SUPPORT
		RETDEC_ENABLE_LLVMIR_EMUL
		RETDEC_ENABLE_LLVMIR2HLL
		RETDEC_ENABLE_MACHO_EXTRACTOR
		RETDEC_ENABLE_CPDETECT
		RETDEC_ENABLE_DEBUGFORMAT)

set_if_at_least_one_set(RETDEC_ENABLE_OPENSLL
		RETDEC_ENABLE_CRYPTO)

set_if_at_least_one_set(RETDEC_ENABLE_RAPIDJSON
		RETDEC_ENABLE_AR_EXTRACTOR
		RETDEC_ENABLE_AR_EXTRACTORTOOL
		RETDEC_ENABLE_CONFIG
		RETDEC_ENABLE_CTYPESPARSER
		RETDEC_ENABLE_FILEINFO
		RETDEC_ENABLE_MACHO_EXTRACTOR
		RETDEC_ENABLE_MACHO_EXTRACTORTOOL
		RETDEC_ENABLE_SERDES)

set_if_at_least_one_set(RETDEC_ENABLE_TINYXML2
		RETDEC_ENABLE_TINYXML2
		RETDEC_ENABLE_FILEINFO
		RETDEC_ENABLE_CPDETECT)

set_if_at_least_one_set(RETDEC_ENABLE_VARIANT
		RETDEC_ENABLE_UTILS)

set_if_at_least_one_set(RETDEC_ENABLE_WHEREAMI
		RETDEC_ENABLE_UTILS)

set_if_at_least_one_set(RETDEC_ENABLE_YARA
		RETDEC_ENABLE_YARACPP)

set_if_at_least_one_set(RETDEC_ENABLE_YARAMOD
		RETDEC_ENABLE_BIN2PAT
		RETDEC_ENABLE_IDR2PAT
		RETDEC_ENABLE_PAT2YARA
		RETDEC_ENABLE_PATTERNGEN)
