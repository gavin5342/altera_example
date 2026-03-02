set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR ARM)
 
# point ARM_TOOLCHAIN_BIN_DIR to things like
set(ARM_TOOLCHAIN_DIR ${ARM_TOOLCHAIN_BIN_DIR})
set(BINUTILS_PATH ${ARM_TOOLCHAIN_DIR}) 
 
set(TOOLCHAIN_PREFIX ${ARM_TOOLCHAIN_DIR}/arm-none-eabi-)
 
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)
 
set(CMAKE_C_COMPILER "${TOOLCHAIN_PREFIX}gcc")
set(CMAKE_ASM_COMPILER ${CMAKE_C_COMPILER})
set(CMAKE_CXX_COMPILER "${TOOLCHAIN_PREFIX}g++")
set(CMAKE_OBJCOPY      "${TOOLCHAIN_PREFIX}objcopy")
set(CMAKE_SIZE         "${TOOLCHAIN_PREFIX}size")

set(CMAKE_EXECUTABLE_SUFFIX_ASM     ".elf")
set(CMAKE_EXECUTABLE_SUFFIX_C       ".elf")
set(CMAKE_EXECUTABLE_SUFFIX_CXX     ".elf")

set(CMAKE_C_LINK_FLAGS "${CMAKE_C_LINK_FLAGS} -nostdlib -Xlinker -Map=\"thinion.map\" -Xlinker --gc-sections")
set(CMAKE_C_LINK_FLAGS "${CMAKE_C_LINK_FLAGS} -Xlinker -print-memory-usage -Xlinker --sort-section=alignment")
set(CMAKE_C_LINK_FLAGS "${CMAKE_C_LINK_FLAGS} -Xlinker --cref ")

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -specs=nano.specs")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -ffunction-sections -fno-common -fdata-sections")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -ffreestanding -fno-builtin -fstack-usage")
# Strip the absoulte path out of __FILE__ included in source 
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fmacro-prefix-map=\"${CMAKE_CURRENT_LIST_DIR}\"=")


set(CMAKE_OBJCOPY ${TOOLCHAIN_PREFIX}objcopy CACHE INTERNAL "objcopy tool")
set(CMAKE_SIZE_UTIL ${TOOLCHAIN_PREFIX}size CACHE INTERNAL "size tool")
 
set(CMAKE_FIND_ROOT_PATH ${BINUTILS_PATH})
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
