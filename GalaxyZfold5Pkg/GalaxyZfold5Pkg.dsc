[Defines]
  VENDOR_NAME                    = Samsung
  PLATFORM_NAME                  = q5q
  PLATFORM_GUID                  = 28f1a3bf-193a-47e3-a7b9-5a435eaab2ee
  PLATFORM_VERSION               = 0.1
  DSC_SPECIFICATION              = 0x00010019
  OUTPUT_DIRECTORY               = Build/$(PLATFORM_NAME)
  SUPPORTED_ARCHITECTURES        = AARCH64
  BUILD_TARGETS                  = DEBUG|RELEASE
  SKUID_IDENTIFIER               = DEFAULT
  FLASH_DEFINITION               = GalaxyZfold5Pkg/GalaxyZfold5Pkg.fdf
  SOC_PLATFORM            = SM8550
  USE_PHYSICAL_TIMER      = FALSE

# !include Platform/Qualcomm/sm8550/sm8550.dsc
!include GalaxyZfold5Pkg/CommonDsc.dsc.inc

[BuildOptions.common]
#  GCC:*_*_AARCH64_CC_FLAGS = -DENABLE_SIMPLE_INIT

[PcdsFixedAtBuild.common]

#  gQcomTokenSpaceGuid.PcdMipiFrameBufferWidth|2176
#  gQcomTokenSpaceGuid.PcdMipiFrameBufferHeight|1812

  # Simple Init
#  gSimpleInitTokenSpaceGuid.PcdGuiDefaultDPI|400

  gQcomTokenSpaceGuid.PcdDeviceVendor|"Samsung"
  gQcomTokenSpaceGuid.PcdDeviceProduct|"Galaxy Z fold5"
  gQcomTokenSpaceGuid.PcdDeviceCodeName|"q5q"

#-----------------------
  gArmTokenSpaceGuid.PcdSystemMemoryBase|0x80000000         # Starting address
  gArmTokenSpaceGuid.PcdSystemMemorySize|0xFDFA0000         # Limit to 4GB Size here

  gArmTokenSpaceGuid.PcdCpuVectorBaseAddress|0xA7600000     # CPU Vectors
  gArmTokenSpaceGuid.PcdArmArchTimerFreqInHz|19200000
  gArmTokenSpaceGuid.PcdArmArchTimerSecIntrNum|29
  gArmTokenSpaceGuid.PcdArmArchTimerIntrNum|30
  gArmTokenSpaceGuid.PcdGicDistributorBase|0x17100000
  gArmTokenSpaceGuid.PcdGicRedistributorsBase|0x17180000

  gEfiMdeModulePkgTokenSpaceGuid.PcdAcpiDefaultOemRevision|0x00000850
  gEmbeddedTokenSpaceGuid.PcdPrePiStackBase|0x9F590000      # UEFI Stack
  gEmbeddedTokenSpaceGuid.PcdPrePiStackSize|0x00040000      # 256K stack
  gEmbeddedTokenSpaceGuid.PcdPrePiCpuIoSize|44

  gQcomTokenSpaceGuid.PcdUefiMemPoolBase|0xA0000000         # DXE Heap base address
  gQcomTokenSpaceGuid.PcdUefiMemPoolSize|0x0EB00000         # UefiMemorySize, DXE heap size

#  gQcomTokenSpaceGuid.PcdMipiFrameBufferAddress|0xB8000000
        gQcomTokenSpaceGuid.PcdMipiFrameBufferHeaderAddress|0xB8000000
        gQcomTokenSpaceGuid.PcdMipiFrameBufferAddress|0xB807F800
        gQcomTokenSpaceGuid.PcdMipiFrameBufferFooterAddress|0xB8E8B000
        gQcomTokenSpaceGuid.PcdMipiFrameBufferWidth|2176
        gQcomTokenSpaceGuid.PcdMipiFrameBufferHeight|1692
        gQcomTokenSpaceGuid.PcdMipiFrameBufferPixelBpp|32

  gQcomTokenSpaceGuid.PcdDeviceTreeStore|0x83300000

  gArmPlatformTokenSpaceGuid.PcdCoreCount|8
  gArmPlatformTokenSpaceGuid.PcdClusterCount|4


[LibraryClasses.common]

  # Ported from SurfaceDuoPkg
#  AslUpdateLib|Silicon/Qualcomm/QcomPkg/Library/DxeAslUpdateLib/DxeAslUpdateLib.inf

  PlatformMemoryMapLib|GalaxyZfold5Pkg/Library/PlatformMemoryMapLib/PlatformMemoryMapLib.inf
  PlatformPeiLib|GalaxyZfold5Pkg/Library/PlatformPeiLib/PlatformPeiLib.inf
  PlatformPrePiLib|GalaxyZfold5Pkg/Library/PlatformPrePiLib/PlatformPrePiLib.inf
  MsPlatformDevicesLib|GalaxyZfold5Pkg/Library/MsPlatformDevicesLib/MsPlatformDevicesLib.inf
  SOCSmbiosInfoLib|GalaxyZfold5Pkg/Library/SOCSmbiosInfoLib/SOCSmbiosInfoLib.inf
