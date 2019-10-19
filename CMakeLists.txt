cmake_minimum_required(VERSION 3.12 FATAL_ERROR)

## Disable in-source builds
set(CMAKE_DISABLE_SOURCE_CHANGES TRUE)
set(CMAKE_DISABLE_IN_SOURCE_BUILD TRUE)

## Require a C++ 17 compiler
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED 1)

## Build Debug by default
set(CMAKE_BUILD_TYPE Debug CACHE STRING "")

## Declare a new project
project(CPP17)

## Add sources
set(SOURCES	main.cpp)
list(TRANSFORM SOURCES PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/")
# Put files in "Folders" (for IDE projects)
set_property(GLOBAL PROPERTY USE_FOLDERS ON)
source_group(TREE "${CMAKE_CURRENT_SOURCE_DIR}" FILES ${SOURCES})

## Create an executable target
add_executable(${PROJECT_NAME} ${SOURCES})
set_target_properties(${PROJECT_NAME} PROPERTIES OUTPUT_NAME "HelloWorld")
