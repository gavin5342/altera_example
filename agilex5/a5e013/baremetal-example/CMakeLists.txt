cmake_minimum_required(VERSION 3.5...3.28)


# Enable size-oriented codegen (optional but recommended with nano)
# add_compile_options(-ffunction-sections -fdata-sections)
# add_link_options(-Wl,--gc-sections)

# Prefer nano newlib everywhere
# add_link_options(-specs=nano.specs)

# If you need printf/scanf float support with nano (optional):
# add_link_options(-u _printf_float -u _scanf_floa


# disable building tests
set(BUILD_TESTS OFF)

# library dir
get_filename_component(LIBRARY_DIR "../baremetal-drivers" ABSOLUTE)

# library project
add_subdirectory(${LIBRARY_DIR} alterametal)

# linker script
set(ALTERAMETAL_LINKER_SCRIPT "${LIBRARY_DIR}/build/aarch64/core0_ocram.ld")

# project
project(bm_hello_world C CXX ASM)

# target
add_executable(hello_world.elf)

# sources
target_sources(hello_world.elf
    PRIVATE
        hello_world.c
)

# compile options
if(CMAKE_BUILD_TYPE STREQUAL "Debug")
    target_compile_options(hello_world.elf PRIVATE -DFSBL_EXECUTION ${DEFAULT_C_FLAGS_DEBUG})
    target_compile_options(hello_world.elf PRIVATE ${DEFAULT_C_FLAGS_DEBUG})
else()
    target_compile_options(hello_world.elf PRIVATE -DFSBL_EXECUTION ${DEFAULT_C_FLAGS_RELEASE})
    target_compile_options(hello_world.elf PRIVATE ${DEFAULT_C_FLAGS_RELEASE})
endif()

# link to the baremetal library
target_link_libraries(hello_world.elf PRIVATE
    alterametal
)

# specify linker script
target_link_options(hello_world.elf PRIVATE
    -T${ALTERAMETAL_LINKER_SCRIPT}
    --specs=nosys.specs -mstrict-align 
)
