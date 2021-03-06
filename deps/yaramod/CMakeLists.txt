include(ExternalProject)

if(CMAKE_C_COMPILER)
	set(CMAKE_C_COMPILER_OPTION "-DCMAKE_C_COMPILER=${CMAKE_C_COMPILER}")
endif()
if(CMAKE_CXX_COMPILER)
	set(CMAKE_CXX_COMPILER_OPTION "-DCMAKE_CXX_COMPILER=${CMAKE_CXX_COMPILER}")
endif()

if(YARAMOD_LOCAL_DIR)
	message(STATUS "YaraMod: using local YaraMod directory.")

	ExternalProject_Add(yaramod-project
		DOWNLOAD_COMMAND ""
		SOURCE_DIR "${YARAMOD_LOCAL_DIR}"
		CMAKE_ARGS
			# This does not work on MSVC, but may be useful on Linux.
			-DCMAKE_BUILD_TYPE=Release
			-DCMAKE_CXX_FLAGS_RELEASE=${CMAKE_CXX_FLAGS_RELEASE}
			# Force the use of the same compiler as used to build the top-level
			# project. Otherwise, the external project may pick up a different
			# compiler, which may result in link errors.
			"${CMAKE_C_COMPILER_OPTION}"
			"${CMAKE_CXX_COMPILER_OPTION}"
		# Disable the update step.
		UPDATE_COMMAND ""
		# Disable the install step.
		INSTALL_COMMAND ""
	)
	force_configure_step(yaramod-project)
else()
	message(STATUS "YaraMod: using remote YaraMod revision.")

	ExternalProject_Add(yaramod-project
		URL ${YARAMOD_URL}
		URL_HASH SHA256=${YARAMOD_ARCHIVE_SHA256}
		DOWNLOAD_NAME yaramod.zip
		CMAKE_ARGS
			# This does not work on MSVC, but may be useful on Linux.
			-DCMAKE_BUILD_TYPE=Release
			-DCMAKE_CXX_FLAGS_RELEASE=${CMAKE_CXX_FLAGS_RELEASE}
			# Force the use of the same compiler as used to build the top-level
			# project. Otherwise, the external project may pick up a different
			# compiler, which may result in link errors.
			"${CMAKE_C_COMPILER_OPTION}"
			"${CMAKE_CXX_COMPILER_OPTION}"
		# Disable the update step.
		UPDATE_COMMAND ""
		# Disable the install step.
		INSTALL_COMMAND ""
		LOG_DOWNLOAD ON
		LOG_CONFIGURE ON
		LOG_BUILD ON
	)
endif()

check_if_variable_changed(YARAMOD_LOCAL_DIR CHANGED)
if(CHANGED)
	ExternalProject_Get_Property(yaramod-project binary_dir)
	message(STATUS "YaraMod: path to YaraMod directory changed -> cleaning CMake files in ${binary_dir}.")
	clean_cmake_files(${binary_dir})
endif()

ExternalProject_Get_Property(yaramod-project source_dir)
ExternalProject_Get_Property(yaramod-project binary_dir)

# Add libraries.
add_library(yaramod INTERFACE)
add_dependencies(yaramod yaramod-project)
target_include_directories(yaramod SYSTEM INTERFACE ${source_dir}/include)
target_include_directories(yaramod SYSTEM INTERFACE ${source_dir}/deps)
target_include_directories(yaramod SYSTEM INTERFACE ${binary_dir}/src)
target_include_directories(yaramod SYSTEM INTERFACE ${source_dir}/deps/pog/include)
target_include_directories(yaramod SYSTEM INTERFACE ${source_dir}/deps/pog/include/pog)
target_include_directories(yaramod SYSTEM INTERFACE ${source_dir}/deps/pog/deps/fmt/fmt/include)
target_include_directories(yaramod SYSTEM INTERFACE ${source_dir}/deps/pog/deps/re2/re2)
target_link_libraries(yaramod
	INTERFACE debug
		${binary_dir}/src/${DEBUG_DIR}${CMAKE_STATIC_LIBRARY_PREFIX}yaramod${CMAKE_STATIC_LIBRARY_SUFFIX}
		${binary_dir}/deps/pog/deps/fmt/fmt/${CMAKE_INSTALL_LIBDIR}/${CMAKE_STATIC_LIBRARY_PREFIX}pog_fmt${CMAKE_STATIC_LIBRARY_SUFFIX}
		${binary_dir}/deps/pog/deps/re2/re2/${CMAKE_INSTALL_LIBDIR}/${CMAKE_STATIC_LIBRARY_PREFIX}pog_re2${CMAKE_STATIC_LIBRARY_SUFFIX}
)
target_link_libraries(yaramod
	INTERFACE optimized
		${binary_dir}/src/${RELEASE_DIR}${CMAKE_STATIC_LIBRARY_PREFIX}yaramod${CMAKE_STATIC_LIBRARY_SUFFIX}
		${binary_dir}/deps/pog/deps/fmt/fmt/${CMAKE_INSTALL_LIBDIR}/${CMAKE_STATIC_LIBRARY_PREFIX}pog_fmt${CMAKE_STATIC_LIBRARY_SUFFIX}
		${binary_dir}/deps/pog/deps/re2/re2/${CMAKE_INSTALL_LIBDIR}/${CMAKE_STATIC_LIBRARY_PREFIX}pog_re2${CMAKE_STATIC_LIBRARY_SUFFIX}
)
if(WIN32)
	target_link_libraries(yaramod INTERFACE debug shlwapi)
	target_link_libraries(yaramod INTERFACE optimized shlwapi)
endif()
