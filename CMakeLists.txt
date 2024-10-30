cmake_minimum_required(VERSION 3.30)

function(generate_freertos_libs
  SUFFIX
  FREERTOS_CONFIG_LIBRARY
  FREERTOS_PORT)

  add_subdirectory(${CMAKE_CURRENT_FUNCTION_LIST_DIR}/Source ${CMAKE_CURRENT_BINARY_DIR}/${SUFFIX}/FreeRtosSource)
  add_subdirectory(${CMAKE_CURRENT_FUNCTION_LIST_DIR}/CMSIS/RTOS2/FreeRTOS
  ${CMAKE_CURRENT_BINARY_DIR}/${SUFFIX}/FreeRtosCmsis)

  generate_freertos_cmsis(${SUFFIX})
  generate_freertos_kernel(${SUFFIX} ${FREERTOS_CONFIG_LIBRARY} ${FREERTOS_PORT})

target_link_libraries(CMSIS_RTOS2_FreeRTOS-${SUFFIX} INTERFACE freertos_kernel-${SUFFIX})
  
endfunction()
