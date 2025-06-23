cmake_minimum_required(VERSION 3.10)

project(ASCII_Match_3_Raylib VERSION 1.0.0 LANGUAGES C)

set(CMAKE_C_STANDARD 99)
set(CMAKE_C_STANDARD_REQUIRED ON)

if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Release)
endif()

set(CMAKE_C_FLAGS_DEBUG "-g -O0 -Wall -Wextra")
set(CMAKE_C_FLAGS_RELEASE "-O3 -DNDEBUG")

find_package(PkgConfig REQUIRED)
pkg_check_modules(RAYLIB REQUIRED raylib)

include_directories(${RAYLIB_INCLUDE_DIRS})

file(GLOB_RECURSE SOURCES "src/*.c")

add_executable(${PROJECT_NAME} ${SOURCES})

target_link_libraries(${PROJECT_NAME} ${RAYLIB_LIBRARIES})
target_link_directories(${PROJECT_NAME} PRIVATE ${RAYLIB_LIBRARY_DIRS})
target_compile_options(${PROJECT_NAME} PRIVATE ${RAYLIB_CFLAGS_OTHER})

if(EXISTS ${CMAKE_SOURCE_DIR}/assets)
    file(COPY ${CMAKE_SOURCE_DIR}/assets DESTINATION ${CMAKE_BINARY_DIR})
endif()

install(TARGETS ${PROJECT_NAME} DESTINATION bin)

if(EXISTS ${CMAKE_SOURCE_DIR}/assets)
    install(DIRECTORY assets DESTINATION share/${PROJECT_NAME})
endif()