# Collect flags that are used in the code, as macros
SET(CONFIG_FILE ${CMAKE_SOURCE_DIR}/CMakeConfig.cmake)
IF(EXISTS "${CONFIG_FILE}")
	MESSAGE(STATUS "Load config file ${CONFIG_FILE}")
	INCLUDE(${CONFIG_FILE})
ELSE()
	MESSAGE(FATAL_ERROR "Cannot find config file ${CONFIG_FILE}")
ENDIF()

ADD_DEFINITIONS("-MMD -DNRF52 -DEPD_ENABLE_EXTRA_RAM -DNRF51_USE_SOFTDEVICE=${NRF51_USE_SOFTDEVICE} -DUSE_RENDER_CONTEXT -DSYSCALLS -DUSING_FUNC")

LIST(APPEND CUSTOM_DEFINITIONS, TEMPERATURE)

ADD_DEFINITIONS("-DBLE_STACK_SUPPORT_REQD")

IF(NRF51_USE_SOFTDEVICE)
	ADD_DEFINITIONS("-DSOFTDEVICE_PRESENT")
ENDIF()

IF(CMAKE_BUILD_TYPE MATCHES "Debug")
	ADD_DEFINITIONS("-DGIT_HASH=${GIT_HASH}")
	ADD_DEFINITIONS("-DGIT_BRANCH=${GIT_BRANCH}")
ENDIF()

IF(DEFINED DEVICE_TYPE)
	ADD_DEFINITIONS("-DDEVICE_TYPE=${DEVICE_TYPE}")
ENDIF()

# Pass variables in defined in the configuration file to the compiler
ADD_DEFINITIONS("-DNRF51822_DIR=${NRF51822_DIR}")
ADD_DEFINITIONS("-DNORDIC_SDK_VERSION=${NORDIC_SDK_VERSION}")
ADD_DEFINITIONS("-DSOFTDEVICE_SERIES=${SOFTDEVICE_SERIES}")
ADD_DEFINITIONS("-DSOFTDEVICE_MAJOR=${SOFTDEVICE_MAJOR}")
ADD_DEFINITIONS("-DSOFTDEVICE_MINOR=${SOFTDEVICE_MINOR}")
ADD_DEFINITIONS("-DSOFTDEVICE=${SOFTDEVICE}")
ADD_DEFINITIONS("-DSOFTDEVICE_NO_SEPARATE_UICR_SECTION=${SOFTDEVICE_NO_SEPARATE_UICR_SECTION}")
ADD_DEFINITIONS("-DAPPLICATION_START_ADDRESS=${APPLICATION_START_ADDRESS}")
ADD_DEFINITIONS("-DAPPLICATION_LENGTH=${APPLICATION_LENGTH}")
ADD_DEFINITIONS("-DCOMPILATION_TIME=${COMPILATION_TIME}")
#ADD_DEFINITIONS("-DHARDWARE_BOARD=${HARDWARE_BOARD}")
ADD_DEFINITIONS("-DSERIAL_VERBOSITY=${SERIAL_VERBOSITY}")
ADD_DEFINITIONS("-DMASTER_BUFFER_SIZE=${MASTER_BUFFER_SIZE}")
ADD_DEFINITIONS("-DDEFAULT_ON=${DEFAULT_ON}")
ADD_DEFINITIONS("-DRSSI_ENABLE=${RSSI_ENABLE}")
ADD_DEFINITIONS("-DTX_POWER=${TX_POWER}")
ADD_DEFINITIONS("-DADVERTISEMENT_INTERVAL=${ADVERTISEMENT_INTERVAL}")
ADD_DEFINITIONS("-DMIN_ENV_TEMP=${MIN_ENV_TEMP}")
ADD_DEFINITIONS("-DMAX_ENV_TEMP=${MAX_ENV_TEMP}")
ADD_DEFINITIONS("-DLOW_POWER_MODE=${LOW_POWER_MODE}")
ADD_DEFINITIONS("-DPWM_ENABLE=${PWM_ENABLE}")
ADD_DEFINITIONS("-DFIRMWARE_VERSION=${FIRMWARE_VERSION}")
ADD_DEFINITIONS("-DBOOT_DELAY=${BOOT_DELAY}")
ADD_DEFINITIONS("-DSCAN_DURATION=${SCAN_DURATION}")
ADD_DEFINITIONS("-DSCAN_SEND_DELAY=${SCAN_SEND_DELAY}")
ADD_DEFINITIONS("-DSCAN_BREAK_DURATION=${SCAN_BREAK_DURATION}")
ADD_DEFINITIONS("-DMAX_CHIP_TEMP=${MAX_CHIP_TEMP}")
ADD_DEFINITIONS("-DSCAN_FILTER=${SCAN_FILTER}")
ADD_DEFINITIONS("-DSCAN_FILTER_SEND_FRACTION=${SCAN_FILTER_SEND_FRACTION}")
ADD_DEFINITIONS("-DINTERVAL_SCANNER_ENABLED=${INTERVAL_SCANNER_ENABLED}")
ADD_DEFINITIONS("-DCONTINUOUS_POWER_SAMPLER=${CONTINUOUS_POWER_SAMPLER}")
ADD_DEFINITIONS("-DDEFAULT_OPERATION_MODE=${DEFAULT_OPERATION_MODE}")
ADD_DEFINITIONS("-DPERSISTENT_FLAGS_DISABLED=${PERSISTENT_FLAGS_DISABLED}")
ADD_DEFINITIONS("-DMESH_NUM_HANDLES=${MESH_NUM_HANDLES}")
ADD_DEFINITIONS("-DMESH_ACCESS_ADDRESS=${MESH_ACCESS_ADDRESS}")
ADD_DEFINITIONS("-DMESH_INTERVAL_MIN_MS=${MESH_INTERVAL_MIN_MS}")
ADD_DEFINITIONS("-DMESH_CHANNEL=${MESH_CHANNEL}")
ADD_DEFINITIONS("-DNRF_SERIES=${NRF_SERIES}")
ADD_DEFINITIONS("-DRAM_R1_BASE=${RAM_R1_BASE}")
ADD_DEFINITIONS("-DMAX_NUM_VS_SERVICES=${MAX_NUM_VS_SERVICES}")
ADD_DEFINITIONS("-DADVERTISEMENT_IMPROVEMENT=${ADVERTISEMENT_IMPROVEMENT}")
ADD_DEFINITIONS("-DCONNECTION_ALIVE_TIMEOUT=${CONNECTION_ALIVE_TIMEOUT}")

# Define PANs
ADD_DEFINITIONS("-DNRF52_PAN_12")
ADD_DEFINITIONS("-DNRF52_PAN_15")
ADD_DEFINITIONS("-DNRF52_PAN_20")
ADD_DEFINITIONS("-DNRF52_PAN_28") # Although rev1 shouldn't have this PAN, defining it did fix our code
ADD_DEFINITIONS("-DNRF52_PAN_31")
ADD_DEFINITIONS("-DNRF52_PAN_36")
ADD_DEFINITIONS("-DNRF52_PAN_51")
ADD_DEFINITIONS("-DNRF52_PAN_54")
ADD_DEFINITIONS("-DNRF52_PAN_55")
ADD_DEFINITIONS("-DNRF52_PAN_58")
ADD_DEFINITIONS("-DNRF52_PAN_64")
ADD_DEFINITIONS("-DNRF52_PAN_66")
ADD_DEFINITIONS("-DNRF52_PAN_67")
ADD_DEFINITIONS("-DNRF52_PAN_68")
ADD_DEFINITIONS("-DNRF52_PAN_72")
ADD_DEFINITIONS("-DNRF52_PAN_74")
ADD_DEFINITIONS("-DNRF52_PAN_75")
ADD_DEFINITIONS("-DNRF52_PAN_76")
ADD_DEFINITIONS("-DNRF52_PAN_77")
ADD_DEFINITIONS("-DNRF52_PAN_78")
ADD_DEFINITIONS("-DNRF52_PAN_79")
ADD_DEFINITIONS("-DNRF52_PAN_81")
ADD_DEFINITIONS("-DNRF52_PAN_83")
ADD_DEFINITIONS("-DNRF52_PAN_84")
ADD_DEFINITIONS("-DNRF52_PAN_86")
ADD_DEFINITIONS("-DNRF52_PAN_87")
ADD_DEFINITIONS("-DNRF52_PAN_88")
ADD_DEFINITIONS("-DNRF52_PAN_89")
ADD_DEFINITIONS("-DNRF52_PAN_91")
ADD_DEFINITIONS("-DNRF52_PAN_97")
ADD_DEFINITIONS("-DNRF52_PAN_101")
ADD_DEFINITIONS("-DNRF52_PAN_108")
ADD_DEFINITIONS("-DNRF52_PAN_109")
ADD_DEFINITIONS("-DNRF52_PAN_113")
ADD_DEFINITIONS("-DNRF52_PAN_132")
ADD_DEFINITIONS("-DNRF52_PAN_136")
ADD_DEFINITIONS("-DNRF52_PAN_138")
ADD_DEFINITIONS("-DNRF52_PAN_141")

# Set Attribute table size
ADD_DEFINITIONS("-DATTR_TABLE_SIZE=${ATTR_TABLE_SIZE}")

# Add encryption
ADD_DEFINITIONS("-DENCRYPTION=${ENCRYPTION}")
ADD_DEFINITIONS("-DSTATIC_PASSKEY=${STATIC_PASSKEY}")

ADD_DEFINITIONS("-DMESHING=${MESHING}")
ADD_DEFINITIONS("-DBUILD_MESHING=${BUILD_MESHING}")

# Mesh Settings
ADD_DEFINITIONS("-DMESH_USE_APP_SCHEDULER")
ADD_DEFINITIONS("-DRBC_MESH_DEBUG=${RBC_MESH_DEBUG}")
ADD_DEFINITIONS("-DRBC_MESH_HANDLE_CACHE_ENTRIES=${RBC_MESH_HANDLE_CACHE_ENTRIES}")
ADD_DEFINITIONS("-DRBC_MESH_DATA_CACHE_ENTRIES=${RBC_MESH_DATA_CACHE_ENTRIES}")
ADD_DEFINITIONS("-DRBC_MESH_APP_EVENT_QUEUE_LENGTH=${RBC_MESH_APP_EVENT_QUEUE_LENGTH}")
ADD_DEFINITIONS("-DRADIO_PCNF1_MAXLEN=${RADIO_PCNF1_MAXLEN}")
ADD_DEFINITIONS("-DRADIO_PCNF0_S1LEN=${RADIO_PCNF0_S1LEN}")
ADD_DEFINITIONS("-DRADIO_PCNF0_LFLEN=${RADIO_PCNF0_LFLEN}")

IF(DEFINED RBC_MESH_VALUE_MAX_LEN)
	ADD_DEFINITIONS("-DRBC_MESH_VALUE_MAX_LEN=${RBC_MESH_VALUE_MAX_LEN}")
ENDIF()

# Add iBeacon default values
ADD_DEFINITIONS("-DIBEACON=${IBEACON}")
#IF(IBEACON)
ADD_DEFINITIONS("-DBEACON_UUID=${BEACON_UUID}")
ADD_DEFINITIONS("-DBEACON_MAJOR=${BEACON_MAJOR}")
ADD_DEFINITIONS("-DBEACON_MINOR=${BEACON_MINOR}")
ADD_DEFINITIONS("-DBEACON_RSSI=${BEACON_RSSI}")
#ENDIF()

ADD_DEFINITIONS("-DEDDYSTONE=${EDDYSTONE}")
ADD_DEFINITIONS("-DCHANGE_NAME_ON_RESET=${CHANGE_NAME_ON_RESET}")

# Add services
ADD_DEFINITIONS("-DCROWNSTONE_SERVICE=${CROWNSTONE_SERVICE}")
ADD_DEFINITIONS("-DINDOOR_SERVICE=${INDOOR_SERVICE}")
ADD_DEFINITIONS("-DGENERAL_SERVICE=${GENERAL_SERVICE}")
ADD_DEFINITIONS("-DPOWER_SERVICE=${POWER_SERVICE}")
ADD_DEFINITIONS("-DSCHEDULE_SERVICE=${SCHEDULE_SERVICE}")

# Add characteristics
ADD_DEFINITIONS("-DCHAR_CONTROL=${CHAR_CONTROL}")
ADD_DEFINITIONS("-DCHAR_MESHING=${CHAR_MESHING}")
ADD_DEFINITIONS("-DCHAR_TEMPERATURE=${CHAR_TEMPERATURE}")
ADD_DEFINITIONS("-DCHAR_RESET=${CHAR_RESET}")
ADD_DEFINITIONS("-DCHAR_CONFIGURATION=${CHAR_CONFIGURATION}")
ADD_DEFINITIONS("-DCHAR_STATE=${CHAR_STATE}")
ADD_DEFINITIONS("-DCHAR_PWM=${CHAR_PWM}")
ADD_DEFINITIONS("-DCHAR_SAMPLE_CURRENT=${CHAR_SAMPLE_CURRENT}")
ADD_DEFINITIONS("-DCHAR_CURRENT_LIMIT=${CHAR_CURRENT_LIMIT}")
ADD_DEFINITIONS("-DCHAR_RSSI=${CHAR_RSSI}")
ADD_DEFINITIONS("-DCHAR_SCAN_DEVICES=${CHAR_SCAN_DEVICES}")
ADD_DEFINITIONS("-DCHAR_TRACK_DEVICES=${CHAR_TRACK_DEVICES}")
ADD_DEFINITIONS("-DCHAR_RELAY=${CHAR_RELAY}")
ADD_DEFINITIONS("-DCHAR_SCHEDULE=${CHAR_SCHEDULE}")

# only required if Nordic files are used
ADD_DEFINITIONS("-DBOARD_NRF6310")

# Publish all options as CMake options as well
#
#SET(CROWNSTONE_SERVICE                 "${CROWNSTONE_SERVICE}"                 CACHE STRING "Enable machine-centric service")
#SET(INDOOR_SERVICE                     "${INDOOR_SERVICE}"                     CACHE STRING "Enable human-centric indoor localization service")
#SET(GENERAL_SERVICE                    "${GENERAL_SERVICE}"                    CACHE STRING "Enable human-centric general service")
#SET(POWER_SERVICE                      "${POWER_SERVICE}"                      CACHE STRING "Enable human-centric power service")
#SET(SCHEDULE_SERVICE                   "${SCHEDULE_SERVICE}"                   CACHE STRING "Enable human-centric schedule service")
#
#SET(CHAR_CONTROL                       "${CHAR_CONTROL}"                       CACHE STRING "Enable control characteristic")
#SET(CHAR_MESHING                       "${CHAR_MESHING}"                       CACHE STRING "Enable meshing characteristic")
#SET(CHAR_TEMPERATURE                   "${CHAR_TEMPERATURE}"                   CACHE STRING "Enable temperature characteristic")
#SET(CHAR_RESET                         "${CHAR_RESET}"                         CACHE STRING "Enable reset characteristic")
#SET(CHAR_CONFIGURATION                 "${CHAR_CONFIGURATION}"                 CACHE STRING "Enable configuration characteristic")
#SET(CHAR_STATE                         "${CHAR_STATE}"                         CACHE STRING "Enable state characteristic")
#SET(CHAR_PWM                           "${CHAR_PWM}"                           CACHE STRING "Enable PWM characteristic")
#SET(CHAR_SAMPLE_CURRENT                "${CHAR_SAMPLE_CURRENT}"                CACHE STRING "Enable sample current characteristic")
#SET(CHAR_CURRENT_LIMIT                 "${CHAR_CURRENT_LIMIT}"                 CACHE STRING "Enable current limit characteristic")
#SET(CHAR_RSSI                          "${CHAR_RSSI}"                          CACHE STRING "Enable RSSI characteristic")
#SET(CHAR_SCAN_DEVICES                  "${CHAR_SCAN_DEVICES}"                  CACHE STRING "Enable scan devices characteristic")
#SET(CHAR_TRACK_DEVICES                 "${CHAR_TRACK_DEVICES}"                 CACHE STRING "Enable track devices characteristic")
#SET(CHAR_RELAY                         "${CHAR_RELAY}"                         CACHE STRING "Enable relay characteristic")
#SET(CHAR_SCHEDULE                      "${CHAR_SCHEDULE}"                      CACHE STRING "Enable schedule characteristic")
#
#SET(BLUETOOTH_NAME                     "${BLUETOOTH_NAME}"                     CACHE STRING "Name of Bluetooth device")
#SET(BUILD_MESHING                      "${BUILD_MESHING}"                      CACHE STRING "BUILD_MESHING" FORCE)