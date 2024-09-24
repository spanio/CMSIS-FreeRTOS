# defines library FW3_CMSIS_TARGET

function(generate_freertos_cmsis
SUFFIX)

add_library(CMSIS_RTOS2_FreeRTOS-${SUFFIX} INTERFACE)

add_library(ThirdParty::ARM::RTOS2::FreeRTOS::${SUFFIX} ALIAS CMSIS_RTOS2_FreeRTOS-${SUFFIX})

target_sources(
  CMSIS_RTOS2_FreeRTOS-${SUFFIX}
  INTERFACE ${CMAKE_CURRENT_FUNCTION_LIST_DIR}/Source/cmsis_os2.c
          ${CMAKE_CURRENT_FUNCTION_LIST_DIR}/Source/freertos_evr.c
          ${CMAKE_CURRENT_FUNCTION_LIST_DIR}/Source/os_systick.c
          ${CMAKE_CURRENT_FUNCTION_LIST_DIR}/Source/ARM/clib_arm.c
          ${CMAKE_CURRENT_FUNCTION_LIST_DIR}/Source/cmsis_os1.c)

target_include_directories(CMSIS_RTOS2_FreeRTOS-${SUFFIX} INTERFACE
  ${CMAKE_CURRENT_FUNCTION_LIST_DIR}/Include
  ${CMAKE_CURRENT_FUNCTION_LIST_DIR}/Include1
)  

set_source_files_properties(${CMAKE_CURRENT_FUNCTION_LIST_DIR}/Source/cmsis_os1.c
                            PROPERTIES COMPILE_OPTIONS -Wno-switch-enum)

endfunction()