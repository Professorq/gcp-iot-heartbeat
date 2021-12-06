cmake_minimum_required(VERSION 3.16)

project(gcp-iot-hearbeat)

add_subdirectory(third-party)

add_executable(jwt-gen
  jwt_gen.cpp)

target_link_libraries(jwt-gen
  jwt
  jansson
  )

target_include_directories(jwt-gen SYSTEM PUBLIC
  $<TARGET_PROPERTY:jwt,INTERFACE_INCLUDE_DIRECTORIES>
  )
