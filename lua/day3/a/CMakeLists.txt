cmake_minimum_required (VERSION 2.8)
project (play)
add_executable (play play.cpp)

target_link_libraries (play lua rtmidi dl)
include_directories (/usr/include /usr/local/include /usr/lib/x86_64-linux-gnu)

