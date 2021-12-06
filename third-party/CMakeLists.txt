include(DownloadProject/DownloadProject.cmake)
include(ExternalProject)

# jansson

download_project(
  PROJ             jansson
  GIT_REPOSITORY   git@github.com:akheron/jansson.git
  )

add_subdirectory(${jansson_SOURCE_DIR} ${jansson_BINARY_DIR})

# libjwt

download_project(
  PROJ             libjwt
  GIT_REPOSITORY   git@github.com:benmcollins/libjwt.git
  )

configure_file("Findjansson.cmake.in"
  ${CMAKE_CURRENT_BINARY_DIR}/Findjansson.cmake
  )
list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_BINARY_DIR})

add_subdirectory(${libjwt_SOURCE_DIR} ${libjwt_BINARY_DIR})

# find_program(MAKE_EXE NAMES make gmake nmake)
# ExternalProject_Add(jwt
#   SOURCE_DIR             ${libjwt_SOURCE_DIR}
#   BINARY_DIR             ${libjwt_BINARY_DIR}
#   BUILD_COMMAND          ${MAKE_EXE}
#   INSTALL_COMMAND        ""
#   DEPENDS                ${JANSSON_LIBRARIES}
#   STEP_TARGETS           build
#   )

# add_library(jwt-static STATIC IMPORTED GLOBAL)
# add_dependencies(jwt-static jwt-build)
# set_target_properties(jwt-static PROPERTIES
#   LOCATION "${libjwt_BINARY_DIR}/lib/libjwt.a"
#   INTERFACE_INCLUDE_DIRECTORIES "${libjwt_SOURCE_DIR}/include"
#   )
