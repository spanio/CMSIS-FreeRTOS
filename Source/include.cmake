include_directories(${FW3_RTOS_DIR}/include)

set(FREERTOS_CONFIG_FILE_DIRECTORY
    ${FW3_APPLICATION_DIR}/Include
    CACHE STRING "")
set(FREERTOS_HEAP
    ${FW3_COMPONENTS_DIR}/Source/no_heap.c
    CACHE STRING "")
                    