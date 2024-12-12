set(CPACK_ARCHIVE_COMPONENT_INSTALL ON)
set(CPACK_COMPONENT_INCLUDE_TOPLEVEL_DIRECTORY 0)
set(CPACK_COMPONENTS_ALL "ultra-viewer")

if (CPACK_GENERATOR STREQUAL "External")
  list(APPEND CPACK_COMPONENTS_ALL "extractor" "appimage")
endif()

if (CPACK_GENERATOR MATCHES "DEB|RPM")
# https://unix.stackexchange.com/a/11552/254512
set(CPACK_PACKAGING_INSTALL_PREFIX "/opt/ship/bin")#/${CMAKE_PROJECT_VERSION}")
set(CPACK_COMPONENT_INCLUDE_TOPLEVEL_DIRECTORY 0)
elseif (CPACK_GENERATOR MATCHES "ZIP")
# set(CPACK_PACKAGING_INSTALL_PREFIX "")
endif()

if (CPACK_GENERATOR MATCHES "External")
set(CPACK_ARCHIVE_COMPONENT_INSTALL ON)
SET(CPACK_MONOLITHIC_INSTALL 1)
set(CPACK_PACKAGING_INSTALL_PREFIX "/usr/bin")
endif()

if (CPACK_GENERATOR MATCHES "Bundle")
    set(CPACK_BUNDLE_NAME "ultra-viewer")
    set(CPACK_BUNDLE_PLIST "Info.plist")
    set(CPACK_BUNDLE_ICON "macosx/ultra-viewer.icns")
    # set(CPACK_BUNDLE_STARTUP_COMMAND "macosx/Starship-macos.sh")
    set(CPACK_BUNDLE_APPLE_CERT_APP "-")
endif()