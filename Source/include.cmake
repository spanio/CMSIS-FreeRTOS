include_directories(${FW3_RTOS_DIR}/include)

set(FREERTOS_HEAP
    ${FW3_COMPONENTS_DIR}/Source/no_heap.c
    CACHE STRING "")
