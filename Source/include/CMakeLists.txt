# FreeRTOS internal cmake file. Do not use it in user top-level project

function(generate_freertos_kernel_include
SUFFIX
FREERTOS_CONFIG_LIBRARY)
    
add_library(freertos_kernel_include-${SUFFIX} INTERFACE)

target_include_directories(freertos_kernel_include-${SUFFIX}
    INTERFACE
        ${CMAKE_CURRENT_FUNCTION_LIST_DIR}
        # Note: DEPRECATED but still supported, may be removed in a future release.
        $<$<NOT:$<TARGET_EXISTS:${FREERTOS_CONFIG_LIBRARY}>>:${FREERTOS_CONFIG_FILE_DIRECTORY}>
)

target_link_libraries(freertos_kernel_include-${SUFFIX}
    INTERFACE
        $<$<TARGET_EXISTS:${FREERTOS_CONFIG_LIBRARY}>:${FREERTOS_CONFIG_LIBRARY}>
)

endfunction()