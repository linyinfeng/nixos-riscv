{ lib }:
let
  inherit (lib.kernel) yes no module freeform;
in {
  # Linux/riscv 5.10.4 Kernel Configuration

  ## General setup
  "COMPILE_TEST" = no; # Compile also drivers which will not load
  "LOCALVERSION_AUTO" = yes; # Automatically append version information to the version string
  "DEFAULT_HOSTNAME" = freeform "(none)"; # Default hostname
  "SWAP" = yes; # Support for paging of anonymous memory (swap)
  "SYSVIPC" = yes; # System V IPC
  "POSIX_MQUEUE" = yes; # POSIX Message Queues
  "WATCH_QUEUE" = no; # General notification queue
  "CROSS_MEMORY_ATTACH" = yes; # Enable process_vm_readv/writev syscalls
  "USELIB" = no; # uselib syscall
  "AUDIT" = no; # Auditing support

  ### General setup -> IRQ subsystem
  "GENERIC_IRQ_DEBUGFS" = no; # Expose irq internals in debugfs
  ### General setup: end of IRQ subsystem

  ### General setup -> Timers subsystem
  "HZ_PERIODIC" = no; # Periodic timer ticks (constant rate, no dynticks)
  "NO_HZ_IDLE" = yes; # Idle dynticks system (tickless idle)
  "NO_HZ" = no; # Old Idle dynticks config
  "HIGH_RES_TIMERS" = yes; # High Resolution Timer Support
  ### General setup: end of Timers subsystem

  "PREEMPT_NONE" = no; # No Forced Preemption (Server)
  "PREEMPT_VOLUNTARY" = no; # Voluntary Kernel Preemption (Desktop)
  "PREEMPT" = yes; # Preemptible Kernel (Low-Latency Desktop)

  ### General setup -> CPU/Task time and stats accounting
  "TICK_CPU_ACCOUNTING" = yes; # Simple tick based cputime accounting
  "VIRT_CPU_ACCOUNTING_GEN" = no; # Full dynticks CPU time accounting
  "BSD_PROCESS_ACCT" = no; # BSD Process Accounting
  "TASKSTATS" = no; # Export task/process statistics through netlink
  "PSI" = no; # Pressure stall information tracking
  ### General setup: end of CPU/Task time and stats accounting

  ### General setup -> RCU Subsystem
  "RCU_EXPERT" = no; # Make expert-level adjustments to RCU configuration
  ### General setup: end of RCU Subsystem

  "IKCONFIG" = yes; # Kernel .config support
  "IKCONFIG_PROC" = yes; # Enable access to .config through /proc/config.gz
  "IKHEADERS" = no; # Enable kernel headers through /sys/kernel/kheaders.tar.xz
  "LOG_BUF_SHIFT" = freeform "15"; # Kernel log buffer size (16 => 64KB, 17 => 128KB)
  "CGROUPS" = yes; # Control Group support
  "MEMCG" = yes; # Memory controller
  "CGROUP_SCHED" = yes; # CPU controller
  "CGROUP_PIDS" = yes; # PIDs controller
  "CGROUP_FREEZER" = yes; # Freezer controller
  "CGROUP_DEVICE" = yes; # Device controller
  "CGROUP_CPUACCT" = yes; # Simple CPU accounting controller
  "NAMESPACES" = yes; # Namespaces support
  "BLK_DEV_INITRD" = yes; # Initial RAM filesystem and RAM disk (initramfs/initrd) support
  "RD_GZIP" = yes; # Support initial ramdisk/ramfs compressed using gzip
  "RD_BZIP2" = yes; # Support initial ramdisk/ramfs compressed using bzip2
  "RD_LZMA" = yes; # Support initial ramdisk/ramfs compressed using LZMA
  "RD_XZ" = yes; # Support initial ramdisk/ramfs compressed using XZ
  "RD_LZO" = yes; # Support initial ramdisk/ramfs compressed using LZO
  "RD_LZ4" = yes; # Support initial ramdisk/ramfs compressed using LZ4
  "RD_ZSTD" = yes; # Support initial ramdisk/ramfs compressed using ZSTD
  "CC_OPTIMIZE_FOR_SIZE" = yes; # Optimize for size (-Os)
  "MULTIUSER" = yes; # Multiple users, groups and capabilities support
  "SYSFS_SYSCALL" = no; # Sysfs syscall support
  "FHANDLE" = yes; # open by fhandle syscalls
  "BUG" = no; # BUG() support
  "ELF_CORE" = yes; # Enable ELF core dumps
  "BASE_FULL" = no; # Enable full-sized data structures for core
  "EPOLL" = yes; # Enable eventpoll support
  "SIGNALFD" = yes; # Enable signalfd() system call
  "TIMERFD" = yes; # Enable timerfd() system call
  "AIO" = no; # Enable AIO support
  "IO_URING" = no; # Enable IO uring support
  "ADVISE_SYSCALLS" = no; # Enable madvise/fadvise syscalls
  "MEMBARRIER" = yes; # Enable membarrier() system call
  "KALLSYMS" = yes; # Load all symbols for debugging/ksymoops
  "KALLSYMS_ALL" = no; # Include all symbols in kallsyms
  "BPF_SYSCALL" = no; # Enable bpf() system call
  "USERFAULTFD" = no; # Enable userfaultfd() system call
  "EMBEDDED" = yes; # Embedded system
  "PC104" = no; # PC/104 support

  ### General setup -> Kernel Performance Events And Counters
  "PERF_EVENTS" = no; # Kernel performance events and counters
  ### General setup: end of Kernel Performance Events And Counters

  "VM_EVENT_COUNTERS" = yes; # Enable VM event counters for /proc/vmstat
  "SLUB_DEBUG" = no; # Enable SLUB debugging support
  "COMPAT_BRK" = yes; # Disable heap randomization
  "SLAB" = no; # SLAB
  "SLUB" = yes; # SLUB (Unqueued Allocator)
  "SLOB" = no; # SLOB (Simple Allocator)
  "SLAB_MERGE_DEFAULT" = yes; # Allow slab caches to be merged
  "SLAB_FREELIST_RANDOM" = no; # Randomize slab freelist
  "SLAB_FREELIST_HARDENED" = no; # Harden slab freelist metadata
  "SHUFFLE_PAGE_ALLOCATOR" = no; # Page allocator randomization
  "PROFILING" = no; # Profiling support
  ## end of General setup

  "MMU" = yes; # MMU-based Paged Memory Management Support
  "FORCE_MAX_ZONEORDER" = freeform "10"; # Maximum zone order

  ## SoC selection
  "SOC_SIFIVE" = no; # SiFive SoCs
  "SOC_VIRT" = no; # QEMU Virt Machine
  "ARCH_CVITEK" = yes; # CVITEK SoCs
  "SOC_THEAD" = yes; # T-HEAD SoCs
  ## end of SoC selection

  ## Platform type
  "ARCH_RV32I" = no; # RV32I
  "ARCH_RV64I" = yes; # RV64I
  "CMODEL_MEDLOW" = no; # medium low code model
  "CMODEL_MEDANY" = yes; # medium any code model
  "MAXPHYSMEM_2GB" = no; # 2GiB
  "MAXPHYSMEM_128GB" = yes; # 128GiB
  "SMP" = no; # Symmetric Multi-Processing
  "TUNE_GENERIC" = yes; # generic
  "RISCV_ISA_C" = yes; # Emit compressed instructions when building Linux
  "NO_SFENCE_VMA" = yes; # Replace sfence.vma with CSR_SMCIR operation
  "RISCV_SWIOTLB" = no; # Enable SWIOTLB
  "FPU" = yes; # FPU support
  "VECTOR" = no; # VECTOR support
  ## end of Platform type

  ## Kernel features
  "HZ_12" = no; # 12 HZ
  "HZ_100" = no; # 100 HZ
  "HZ_250" = yes; # 250 HZ
  "HZ_300" = no; # 300 HZ
  "HZ_1000" = no; # 1000 HZ
  "RISCV_SBI_V01" = yes; # SBI v0.1 support
  "COMPAT" = no; # Kernel support for 32-bit U-mode
  ## end of Kernel features

  ## Boot options
  "EFI" = yes; # UEFI runtime support
  ## end of Boot options

  ## Power management options
  "PM" = no; # Device power management core functionality
  ## end of Power management options

  ## Firmware Drivers
  "FIRMWARE_MEMMAP" = no; # Add firmware-provided memory map to sysfs
  "GOOGLE_FIRMWARE" = no; # Google Firmware Drivers

  ### Firmware Drivers -> EFI (Extensible Firmware Interface) Support
  "EFI_BOOTLOADER_CONTROL" = no; # EFI Bootloader Control
  "EFI_CAPSULE_LOADER" = no; # EFI capsule loader
  "EFI_TEST" = no; # EFI Runtime Service Tests Support
  "RESET_ATTACK_MITIGATION" = no; # Reset memory attack mitigation
  "EFI_DISABLE_PCI_DMA" = no; # Clear Busmaster bit on PCI bridges during ExitBootServices()
  ### Firmware Drivers: end of EFI (Extensible Firmware Interface) Support
  ## end of Firmware Drivers

  "ARCH_CV181X" = yes; # Cvitek CV181X SoC
  "ARCH_CV180X" = no; # Cvitek CV180X SoC
  "ARCH_CVITEK_CHIP" = freeform "cv181x"; # cv181x
  "ARCH_CV181X_PALLADIUM" = no; # Cvitek CV181X SoC - Palladium
  "ARCH_CV181X_FPGA" = no; # Cvitek CV181X SoC - FPGA
  "ARCH_CV181X_ASIC" = yes; # Cvitek CV181X SoC- ASIC

  ## General architecture-dependent options
  "KPROBES" = no; # Kprobes
  "JUMP_LABEL" = no; # Optimize very unlikely/likely branches
  "SECCOMP" = yes; # Enable seccomp to safely execute untrusted bytecode
  "STACKPROTECTOR" = yes; # Stack Protector buffer overflow detection
  "STACKPROTECTOR_STRONG" = yes; # Strong Stack Protector
  "ARCH_MMAP_RND_BITS" = freeform "18"; # Number of bits to use for ASLR of mmap base address
  "COMPAT_32BIT_TIME" = yes; # Provide system calls for 32-bit time_t
  "STRICT_KERNEL_RWX" = no; # Make kernel text and rodata read-only
  "LOCK_EVENT_COUNTS" = no; # Locking event counts collection

  ### General architecture-dependent options -> GCOV-based kernel profiling
  "GCOV_KERNEL" = no; # Enable gcov-based kernel profiling
  ### General architecture-dependent options: end of GCOV-based kernel profiling
  ## end of General architecture-dependent options

  "MODULES" = yes; # Enable loadable module support
  "MODULE_FORCE_LOAD" = yes; # Forced module loading
  "MODULE_UNLOAD" = yes; # Module unloading
  "MODULE_FORCE_UNLOAD" = no; # Forced module unloading
  "MODVERSIONS" = no; # Module versioning support
  "MODULE_SRCVERSION_ALL" = no; # Source checksum for all modules
  "MODULE_SIG" = no; # Module signature verification
  "MODULE_COMPRESS" = no; # Compress modules on installation
  "MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS" = no; # Allow loading of modules with missing namespace imports
  "UNUSED_SYMBOLS" = no; # Enable unused/obsolete exported symbols
  "TRIM_UNUSED_KSYMS" = no; # Trim unused exported kernel symbols
  "BLOCK" = yes; # Enable the block layer
  "BLK_DEV_BSG" = no; # Block layer SG support v4
  "BLK_DEV_BSGLIB" = no; # Block layer SG support v4 helper lib
  "BLK_DEV_INTEGRITY" = no; # Block layer data integrity support
  "BLK_DEV_ZONED" = no; # Zoned block device support
  "BLK_CMDLINE_PARSER" = no; # Block device command line partition parser
  "BLK_WBT" = no; # Enable support for block device writeback throttling
  "BLK_DEBUG_FS" = yes; # Block layer debugging information in debugfs
  "BLK_SED_OPAL" = no; # Logic for interfacing with Opal enabled SEDs
  "BLK_INLINE_ENCRYPTION" = no; # Enable inline encryption support in block layer

  ### Partition Types
  "PARTITION_ADVANCED" = no; # Advanced partition selection
  ### end of Partition Types

  ## IO Schedulers
  "MQ_IOSCHED_DEADLINE" = no; # MQ deadline I/O scheduler
  "MQ_IOSCHED_KYBER" = no; # Kyber I/O scheduler
  "IOSCHED_BFQ" = no; # BFQ I/O scheduler
  ## end of IO Schedulers

  ## Executable file formats
  "BINFMT_ELF" = yes; # Kernel support for ELF binaries
  "CORE_DUMP_DEFAULT_ELF_HEADERS" = yes; # Write ELF core dumps with partial segments
  "BINFMT_SCRIPT" = yes; # Kernel support for scripts starting with #!
  "BINFMT_FLAT" = no; # Kernel support for flat binaries
  "BINFMT_MISC" = no; # Kernel support for MISC binaries
  "COREDUMP" = yes; # Enable core dump support
  ## end of Executable file formats

  ## Memory Management options
  "FLATMEM_MANUAL" = yes; # Flat Memory
  "SPARSEMEM_MANUAL" = no; # Sparse Memory
  "COMPACTION" = yes; # Allow for memory compaction
  "PAGE_REPORTING" = no; # Free page reporting
  "MIGRATION" = yes; # Page migration
  "KSM" = no; # Enable KSM for page merging
  "DEFAULT_MMAP_MIN_ADDR" = freeform "4096"; # Low address space to protect from user allocation
  "CLEANCACHE" = no; # Enable cleancache driver to cache clean pages if tmem is present
  "FRONTSWAP" = no; # Enable frontswap to cache swap pages if tmem is present
  "CMA" = yes; # Contiguous Memory Allocator
  "CMA_DEBUG" = no; # CMA debug messages (DEVELOPMENT)
  "CMA_DEBUGFS" = no; # CMA debugfs interface
  "CMA_AREAS" = freeform "7"; # Maximum count of the CMA areas
  "ZPOOL" = no; # Common API for compressed memory storage
  "ZBUD" = no; # Low (Up to 2x) density storage for compressed pages
  "ZSMALLOC" = yes; # Memory allocator for compressed pages
  "ZSMALLOC_STAT" = yes; # Export zsmalloc statistics
  "IDLE_PAGE_TRACKING" = no; # Enable idle page tracking
  "PERCPU_STATS" = no; # Collect percpu memory statistics
  "GUP_BENCHMARK" = no; # Enable infrastructure for get_user_pages() and related calls benchmarking
  ## end of Memory Management options

  "NET" = yes; # Networking support

  ### Networking options
  "PACKET" = yes; # Packet socket
  "PACKET_DIAG" = no; # Packet: sockets monitoring interface
  "UNIX" = yes; # Unix domain sockets
  "UNIX_DIAG" = no; # UNIX: socket monitoring interface
  "TLS" = no; # Transport Layer Security support
  "XFRM_USER" = no; # Transformation user configuration interface
  "NET_KEY" = no; # PF_KEY sockets
  "INET" = yes; # TCP/IP networking
  "IP_MULTICAST" = no; # IP: multicasting
  "IP_ADVANCED_ROUTER" = no; # IP: advanced router
  "IP_PNP" = no; # IP: kernel level autoconfiguration
  "NET_IPIP" = no; # IP: tunneling
  "NET_IPGRE_DEMUX" = no; # IP: GRE demultiplexer
  "SYN_COOKIES" = no; # IP: TCP syncookie support
  "NET_IPVTI" = no; # Virtual (secure) IP: tunneling
  "NET_FOU" = no; # IP: Foo (IP protocols) over UDP
  "INET_AH" = no; # IP: AH transformation
  "INET_ESP" = no; # IP: ESP transformation
  "INET_IPCOMP" = no; # IP: IPComp transformation
  "INET_DIAG" = no; # INET: socket monitoring interface
  "TCP_CONG_ADVANCED" = no; # TCP: advanced congestion control
  "TCP_MD5SIG" = no; # TCP: MD5 Signature Option support (RFC2385)
  "IPV6" = yes; # The IPv6 protocol
  "MPTCP" = no; # MPTCP: Multipath TCP
  "NETWORK_SECMARK" = no; # Security Marking
  "NETWORK_PHY_TIMESTAMPING" = no; # Timestamping in PHY devices
  "NETFILTER" = no; # Network packet filtering framework (Netfilter)
  "BPFILTER" = no; # BPF based packet filtering framework (BPFILTER)
  "IP_DCCP" = no; # The DCCP Protocol
  "IP_SCTP" = no; # The SCTP Protocol
  "RDS" = no; # The Reliable Datagram Sockets Protocol
  "TIPC" = no; # The TIPC Protocol
  "ATM" = no; # Asynchronous Transfer Mode (ATM)
  "L2TP" = no; # Layer Two Tunneling Protocol (L2TP)
  "BRIDGE" = no; # 802.1d Ethernet Bridging
  "NET_DSA" = no; # Distributed Switch Architecture
  "VLAN_8021Q" = no; # 802.1Q/802.1ad VLAN Support
  "DECNET" = no; # DECnet Support
  "LLC2" = no; # ANSI/IEEE 802.2 LLC type 2 Support
  "ATALK" = no; # Appletalk protocol support
  "X25" = no; # CCITT X.25 Packet Layer
  "LAPB" = no; # LAPB Data Link Driver
  "PHONET" = no; # Phonet protocols family
  "IEEE802154" = no; # IEEE Std 802.15.4 Low-Rate Wireless Personal Area Networks support
  "NET_SCHED" = no; # QoS and/or fair queueing
  "DCB" = no; # Data Center Bridging support
  "DNS_RESOLVER" = no; # DNS Resolver support
  "BATMAN_ADV" = no; # B.A.T.M.A.N. Advanced Meshing Protocol
  "OPENVSWITCH" = no; # Open vSwitch
  "VSOCKETS" = no; # Virtual Socket protocol
  "NETLINK_DIAG" = no; # NETLINK: socket monitoring interface
  "MPLS" = no; # MultiProtocol Label Switching
  "NET_NSH" = no; # Network Service Header (NSH) protocol
  "HSR" = no; # High-availability Seamless Redundancy (HSR & PRP)
  "NET_SWITCHDEV" = no; # Switch (and switch-ish) device support
  "NET_L3_MASTER_DEV" = no; # L3 Master device support
  "QRTR" = no; # Qualcomm IPC Router support
  "NET_NCSI" = no; # NCSI interface support
  "BPF_JIT" = no; # enable BPF Just In Time compiler

  #### Networking options -> Network testing
  "NET_PKTGEN" = no; # Packet Generator (USE WITH CAUTION)
  #### Networking options: end of Network testing
  ### end of Networking options

  "HAMRADIO" = no; # Amateur Radio support
  "CAN" = no; # CAN bus subsystem support
  "BT" = no; # Bluetooth subsystem support
  "AF_RXRPC" = no; # RxRPC session sockets
  "AF_KCM" = no; # KCM sockets
  "WIRELESS" = yes; # Wireless
  "CFG80211" = yes; # cfg80211 - wireless configuration API
  "NL80211_TESTMODE" = no; # nl80211 testmode command
  "CFG80211_DEVELOPER_WARNINGS" = no; # enable developer warnings
  "CFG80211_CERTIFICATION_ONUS" = no; # cfg80211 certification onus
  "CFG80211_DEFAULT_PS" = yes; # enable powersave by default
  "CFG80211_DEBUGFS" = no; # cfg80211 DebugFS entries
  "CFG80211_CRDA_SUPPORT" = yes; # support CRDA
  "CFG80211_WEXT" = no; # cfg80211 wireless extensions compatibility
  "MAC80211" = no; # Generic IEEE 802.11 Networking Stack (mac80211)
  "WIMAX" = no; # WiMAX Wireless Broadband support
  "RFKILL" = yes; # RF switch subsystem support
  "RFKILL_INPUT" = no; # RF switch input support
  "RFKILL_GPIO" = no; # GPIO RFKILL driver
  "NET_9P" = no; # Plan 9 Resource Sharing Support (9P2000)
  "CAIF" = no; # CAIF support
  "CEPH_LIB" = no; # Ceph core library
  "NFC" = no; # NFC subsystem support
  "PSAMPLE" = no; # Packet-sampling netlink channel
  "NET_IFE" = no; # Inter-FE based on IETF ForCES InterFE LFB
  "LWTUNNEL" = no; # Network light weight tunnels
  "FAILOVER" = no; # Generic failover module
  "ETHTOOL_NETLINK" = yes; # Netlink interface for ethtool

  ## Device Drivers
  "PCI" = no; # PCI support
  "PCCARD" = no; # PCCard (PCMCIA/CardBus) support

  ### Device Drivers -> Generic Driver Options
  "UEVENT_HELPER" = yes; # Support for uevent helper
  "DEVTMPFS" = yes; # Maintain a devtmpfs filesystem to mount at /dev
  "DEVTMPFS_MOUNT" = yes; # Automount devtmpfs at /dev, after the kernel mounted the rootfs
  "STANDALONE" = yes; # Select only drivers that don't need compile-time external firmware
  "PREVENT_FIRMWARE_BUILD" = yes; # Disable drivers features which enable custom firmware building

  #### Device Drivers -> Generic Driver Options -> Firmware loader
  "FW_LOADER" = yes; # Firmware loading facility
  "FW_LOADER_USER_HELPER" = no; # Enable the firmware sysfs fallback mechanism
  "FW_LOADER_COMPRESS" = no; # Enable compressed firmware support
  #### Device Drivers -> Generic Driver Options: end of Firmware loader

  "ALLOW_DEV_COREDUMP" = no; # Allow device coredump
  "DEBUG_DRIVER" = no; # Driver Core verbose debug messages
  "DEBUG_DEVRES" = no; # Managed device resources verbose debug messages
  "DEBUG_TEST_DRIVER_REMOVE" = no; # Test driver remove calls during probe (UNSTABLE)
  "TEST_ASYNC_DRIVER_PROBE" = no; # Build kernel module to test asynchronous driver probing
  "DMA_FENCE_TRACE" = no; # Enable verbose DMA_FENCE_TRACE messages
  ### Device Drivers: end of Generic Driver Options

  ### Device Drivers -> Bus devices
  "MOXTET" = no; # CZ.NIC Turris Mox module configuration bus
  "MHI_BUS" = no; # Modem Host Interface (MHI) bus
  ### Device Drivers: end of Bus devices

  "CONNECTOR" = no; # Connector - unified userspace <-> kernelspace linker
  "GNSS" = no; # GNSS receiver support
  "MTD" = yes; # Memory Technology Device (MTD) support
  "MTD_TESTS" = no; # MTD tests support (DANGEROUS)

  #### Partition parsers
  "MTD_AR7_PARTS" = no; # TI AR7 partitioning parser
  "MTD_CMDLINE_PARTS" = yes; # Command line partition table parsing
  "MTD_OF_PARTS" = no; # OpenFirmware (device tree) partitioning parser
  "MTD_REDBOOT_PARTS" = no; # RedBoot partition table parsing
  #### end of Partition parsers
  "MTD_BLOCK" = yes; # Caching block device access to MTD devices
  "FTL" = no; # FTL (Flash Translation Layer) support
  "NFTL" = no; # NFTL (NAND Flash Translation Layer) support
  "INFTL" = no; # INFTL (Inverse NAND Flash Translation Layer) support
  "RFD_FTL" = no; # Resident Flash Disk (Flash Translation Layer) support
  "SSFDC" = no; # NAND SSFDC (SmartMedia) read only translation layer
  "SM_FTL" = no; # SmartMedia/xD new translation layer
  "MTD_OOPS" = no; # Log panic/oops to an MTD buffer
  "MTD_SWAP" = no; # Swap on MTD device support
  "MTD_PARTITIONED_MASTER" = no; # Retain master device when partitioned

  #### RAM/ROM/Flash chip drivers
  "MTD_CFI" = no; # Detect flash chips by Common Flash Interface (CFI) probe
  "MTD_JEDECPROBE" = no; # Detect non-CFI AMD/JEDEC-compatible flash chips
  "MTD_RAM" = no; # Support for RAM chips in bus mapping
  "MTD_ROM" = no; # Support for ROM chips in bus mapping
  "MTD_ABSENT" = no; # Support for absent chips in bus mapping
  #### end of RAM/ROM/Flash chip drivers

  #### Mapping drivers for chip access
  "MTD_COMPLEX_MAPPINGS" = no; # Support non-linear mappings of flash chips
  "MTD_PLATRAM" = no; # Map driver for platform device RAM (mtd-ram)
  #### end of Mapping drivers for chip access

  #### Self-contained MTD device drivers
  "MTD_DATAFLASH" = no; # Support for AT45xxx DataFlash
  "MTD_MCHP23K256" = no; # Microchip 23K256 SRAM
  "MTD_SST25L" = no; # Support SST25L (non JEDEC) SPI Flash chips
  "MTD_SLRAM" = no; # Uncached system RAM
  "MTD_PHRAM" = no; # Physical system RAM
  "MTD_MTDRAM" = no; # Test driver using RAM
  "MTD_BLOCK2MTD" = no; # MTD using block device
  "MTD_DOCG3" = no; # M-Systems Disk-On-Chip G3
  #### end of Self-contained MTD device drivers

  #### NAND
  "MTD_ONENAND" = no; # OneNAND Device Support
  "MTD_NAND_ECC_SW_HAMMING_SMC" = no; # NAND ECC Smart Media byte order
  "MTD_RAW_NAND" = yes; # Raw/Parallel NAND Device Support
  "MTD_NAND_ECC_SW_BCH" = no; # Support software BCH ECC
  "MTD_NAND_DENALI_DT" = no; # Denali NAND controller as a DT device
  "MTD_NAND_MXIC" = no; # Macronix raw NAND controller
  "MTD_NAND_GPIO" = no; # GPIO assisted NAND controller
  "MTD_NAND_PLATFORM" = no; # Generic NAND controller
  "MTD_NAND_CADENCE" = no; # Support Cadence NAND (HPNFC) controller
  "MTD_NAND_ARASAN" = no; # Support for Arasan NAND flash controller
  "MTD_NAND_NANDSIM" = no; # Support for NAND Flash Simulator
  "MTD_NAND_DISKONCHIP" = no; # DiskOnChip 2000, Millennium and Millennium Plus (NAND reimplementation)
  "MTD_NAND_CVSNFC" = no; # Support SPINFC controller on CVITEK chips
  "MTD_SPI_NAND" = no; # SPI NAND device Support
  #### end of NAND

  #### LPDDR & LPDDR2 PCM memory drivers
  "MTD_LPDDR" = no; # Support for LPDDR flash chips
  #### end of LPDDR & LPDDR2 PCM memory drivers

  "MTD_SPI_NOR" = no; # SPI NOR device support
  "MTD_UBI" = yes; # Enable UBI - Unsorted block images
  "MTD_UBI_WL_THRESHOLD" = freeform "4096"; # UBI wear-leveling threshold
  "MTD_UBI_BEB_LIMIT" = freeform "20"; # Maximum expected bad eraseblock count per 1024 eraseblocks
  "MTD_UBI_FASTMAP" = no; # UBI Fastmap (Experimental feature)
  "MTD_UBI_GLUEBI" = no; # MTD devices emulation driver (gluebi)
  "MTD_UBI_BLOCK" = yes; # Read-only block devices on top of UBI volumes
  "MTD_HYPERBUS" = no; # HyperBus support
  "OF" = yes; # Device Tree and Open Firmware support
  "OF_UNITTEST" = no; # Device Tree runtime unit tests
  "OF_OVERLAY" = no; # Device Tree overlays
  "PARPORT" = no; # Parallel port support
  "BLK_DEV" = yes; # Block devices
  "BLK_DEV_NULL_BLK" = no; # Null test block driver
  "ZRAM" = yes; # Compressed RAM block device support
  "ZRAM_WRITEBACK" = yes; # Write back incompressible or idle page to backing device
  "ZRAM_MEMORY_TRACKING" = yes; # Track zRam block status
  "BLK_DEV_LOOP" = no; # Loopback device support
  "BLK_DEV_DRBD" = no; # DRBD Distributed Replicated Block Device support
  "BLK_DEV_NBD" = no; # Network block device support
  "BLK_DEV_RAM" = no; # RAM block device support
  "CDROM_PKTCDVD" = no; # Packet writing on CD/DVD media (DEPRECATED)
  "ATA_OVER_ETH" = no; # ATA over Ethernet support
  "BLK_DEV_RBD" = no; # Rados block device (RBD)

  ### Device Drivers -> NVME Support
  "NVME_FC" = no; # NVM Express over Fabrics FC host driver
  "NVME_TARGET" = no; # NVMe Target support
  ### Device Drivers: end of NVME Support

  ### Device Drivers -> Misc devices
  "AD525X_DPOT" = no; # Analog Devices Digital Potentiometers
  "DUMMY_IRQ" = no; # Dummy IRQ handler
  "ICS932S401" = no; # Integrated Circuits ICS932S401
  "ENCLOSURE_SERVICES" = no; # Enclosure Services
  "APDS9802ALS" = no; # Medfield Avago APDS9802 ALS Sensor module
  "ISL29003" = no; # Intersil ISL29003 ambient light sensor
  "ISL29020" = no; # Intersil ISL29020 ambient light sensor
  "SENSORS_TSL2550" = no; # Taos TSL2550 ambient light sensor
  "SENSORS_BH1770" = no; # BH1770GLC / SFH7770 combined ALS - Proximity sensor
  "SENSORS_APDS990X" = no; # APDS990X combined als and proximity sensors
  "HMC6352" = no; # Honeywell HMC6352 compass
  "DS1682" = no; # Dallas DS1682 Total Elapsed Time Recorder with Alarm
  "LATTICE_ECP3_CONFIG" = no; # Lattice ECP3 FPGA bitstream configuration via SPI
  "SRAM" = no; # Generic on-chip SRAM driver
  "XILINX_SDFEC" = no; # Xilinx SDFEC 16
  "PVPANIC" = no; # pvpanic device support
  "HISI_HIKEY_USB" = no; # USB GPIO Hub on HiSilicon Hikey 960/970 Platform
  "C2PORT" = no; # Silicon Labs C2 port support

  #### Device Drivers -> Misc devices -> EEPROM support
  "EEPROM_AT24" = no; # I2C EEPROMs / RAMs / ROMs from most vendors
  "EEPROM_AT25" = no; # SPI EEPROMs from most vendors
  "EEPROM_LEGACY" = no; # Old I2C EEPROM reader (DEPRECATED)
  "EEPROM_MAX6875" = no; # Maxim MAX6874/5 power supply supervisor
  "EEPROM_93CX6" = no; # EEPROM 93CX6 support
  "EEPROM_93XX46" = no; # Microwire EEPROM 93XX46 support
  "EEPROM_IDT_89HPESX" = no; # IDT 89HPESx PCIe-swtiches EEPROM / CSR support
  "EEPROM_EE1004" = no; # SPD EEPROMs on DDR4 memory modules
  #### Device Drivers -> Misc devices: end of EEPROM support

  #### Device Drivers -> Misc devices -> Texas Instruments shared transport line discipline
  "TI_ST" = no; # Shared transport core driver
  #### Device Drivers -> Misc devices: end of Texas Instruments shared transport line discipline

  "SENSORS_LIS3_SPI" = no; # STMicroeletronics LIS3LV02Dx three-axis digital accelerometer (SPI)
  "SENSORS_LIS3_I2C" = no; # STMicroeletronics LIS3LV02Dx three-axis digital accelerometer (I2C)
  "ALTERA_STAPL" = no; # Altera FPGA firmware download module
  "ECHO" = no; # Line Echo Canceller support
  "MISC_RTSX_USB" = no; # Realtek USB card reader
  ### Device Drivers: end of Misc devices

  ### Device Drivers -> SCSI device support
  "RAID_ATTRS" = no; # RAID Transport Class
  "SCSI" = yes; # SCSI device support
  "SCSI_PROC_FS" = yes; # legacy /proc/scsi/ support
  "BLK_DEV_SD" = yes; # SCSI disk support
  "CHR_DEV_ST" = no; # SCSI tape support
  "BLK_DEV_SR" = no; # SCSI CDROM support
  "CHR_DEV_SG" = no; # SCSI generic support
  "CHR_DEV_SCH" = no; # SCSI media changer support
  "SCSI_CONSTANTS" = no; # Verbose SCSI error reporting (kernel size += 36K)
  "SCSI_LOGGING" = no; # SCSI logging facility
  "SCSI_SCAN_ASYNC" = no; # Asynchronous SCSI scanning

  #### Device Drivers -> SCSI device support -> SCSI Transports
  "SCSI_SPI_ATTRS" = no; # Parallel SCSI (SPI) Transport Attributes
  "SCSI_FC_ATTRS" = no; # FiberChannel Transport Attributes
  "SCSI_ISCSI_ATTRS" = no; # iSCSI Transport Attributes
  "SCSI_SAS_ATTRS" = no; # SAS Transport Attributes
  "SCSI_SAS_LIBSAS" = no; # SAS Domain Transport Attributes
  "SCSI_SRP_ATTRS" = no; # SRP Transport Attributes
  #### Device Drivers -> SCSI device support: end of SCSI Transports

  "SCSI_LOWLEVEL" = yes; # SCSI low-level drivers
  "ISCSI_TCP" = no; # iSCSI Initiator over TCP/IP
  "ISCSI_BOOT_SYSFS" = no; # iSCSI Boot Sysfs Interface
  "SCSI_UFSHCD" = no; # Universal Flash Storage Controller Driver Core
  "SCSI_DEBUG" = no; # SCSI debugging host and device simulator
  "SCSI_DH" = no; # SCSI Device Handlers
  ### Device Drivers: end of SCSI device support

  "ATA" = no; # Serial ATA and Parallel ATA drivers (libata)
  "MD" = no; # Multiple devices driver support (RAID and LVM)
  "TARGET_CORE" = no; # Generic Target Core Mod (TCM) and ConfigFS Infrastructure
  "NETDEVICES" = yes; # Network device support
  "NET_CORE" = no; # Network core driver support
  "ETHERNET" = yes; # Ethernet driver support
  "NET_VENDOR_ALACRITECH" = no; # Alacritech devices
  "ALTERA_TSE" = no; # Altera Triple-Speed Ethernet MAC support
  "NET_VENDOR_AMAZON" = no; # Amazon Devices
  "NET_VENDOR_AQUANTIA" = no; # aQuantia devices
  "NET_VENDOR_ARC" = no; # ARC devices
  "NET_VENDOR_AURORA" = no; # Aurora VLSI devices
  "NET_VENDOR_BROADCOM" = no; # Broadcom devices
  "NET_VENDOR_CADENCE" = no; # Cadence devices
  "NET_VENDOR_CAVIUM" = no; # Cavium ethernet drivers
  "NET_VENDOR_CORTINA" = no; # Cortina Gemini devices
  "DNET" = no; # Dave ethernet support (DNET)
  "NET_VENDOR_EZCHIP" = no; # EZchip devices
  "NET_VENDOR_GOOGLE" = yes; # Google Devices
  "NET_VENDOR_HUAWEI" = no; # Huawei devices
  "NET_VENDOR_INTEL" = no; # Intel devices
  "NET_VENDOR_MARVELL" = no; # Marvell devices
  "NET_VENDOR_MELLANOX" = yes; # Mellanox devices
  "MLXSW_CORE" = no; # Mellanox Technologies Switch ASICs support
  "MLXFW" = no; # Mellanox Technologies firmware flash module
  "NET_VENDOR_MICREL" = no; # Micrel devices
  "NET_VENDOR_MICROCHIP" = no; # Microchip devices
  "NET_VENDOR_MICROSEMI" = no; # Microsemi devices
  "NET_VENDOR_NATSEMI" = no; # National Semiconductor devices
  "NET_VENDOR_NETRONOME" = no; # Netronome(R) devices
  "NET_VENDOR_NI" = no; # National Instruments Devices
  "ETHOC" = no; # OpenCores 10/100 Mbps Ethernet MAC support
  "NET_VENDOR_PENSANDO" = yes; # Pensando devices
  "NET_VENDOR_QUALCOMM" = no; # Qualcomm devices
  "NET_VENDOR_RENESAS" = no; # Renesas devices
  "NET_VENDOR_ROCKER" = no; # Rocker devices
  "NET_VENDOR_SAMSUNG" = no; # Samsung Ethernet devices
  "NET_VENDOR_SEEQ" = no; # SEEQ devices
  "NET_VENDOR_SOLARFLARE" = no; # Solarflare devices
  "NET_VENDOR_SOCIONEXT" = no; # Socionext ethernet drivers
  "NET_VENDOR_STMICRO" = yes; # STMicroelectronics devices
  "STMMAC_ETH" = yes; # STMicroelectronics Multi-Gigabit Ethernet driver
  "STMMAC_SELFTESTS" = no; # Support for STMMAC Selftests
  "STMMAC_PLATFORM" = yes; # STMMAC Platform bus support
  "DWMAC_DWC_QOS_ETH" = no; # Support for snps,dwc-qos-ethernet.txt DT binding.
  "DWMAC_GENERIC" = no; # Generic driver for DWMAC
  "DWMAC_CVITEK" = yes; # CVITEK DWMAC support
  "DWMAC_INTEL_PLAT" = no; # Intel dwmac support
  "NET_VENDOR_SYNOPSYS" = no; # Synopsys devices
  "NET_VENDOR_VIA" = no; # VIA devices
  "NET_VENDOR_WIZNET" = no; # WIZnet devices
  "NET_VENDOR_XILINX" = yes; # Xilinx devices
  "XILINX_AXI_EMAC" = no; # Xilinx 10/100/1000 AXI Ethernet support
  "XILINX_LL_TEMAC" = no; # Xilinx LL TEMAC (LocalLink Tri-mode Ethernet MAC) driver
  "PHYLIB" = yes; # PHY Device support and infrastructure
  "FIXED_PHY" = yes; # MDIO Bus/PHY emulation with fixed speed/link PHYs
  "SFP" = no; # SFP cage support
  "AMD_PHY" = no; # AMD PHYs
  "ADIN_PHY" = no; # Analog Devices Industrial Ethernet PHYs
  "AQUANTIA_PHY" = no; # Aquantia PHYs
  "AX88796B_PHY" = no; # Asix PHYs
  "BROADCOM_PHY" = no; # Broadcom 54XX PHYs
  "BCM54140_PHY" = no; # Broadcom BCM54140 PHY
  "BCM7XXX_PHY" = no; # Broadcom 7xxx SOCs internal PHYs
  "BCM84881_PHY" = no; # Broadcom BCM84881 PHY
  "BCM87XX_PHY" = no; # Broadcom BCM8706 and BCM8727 PHYs
  "CICADA_PHY" = no; # Cicada PHYs
  "CVITEK_PHY" = yes; # CVITEK PHYs
  "CORTINA_PHY" = no; # Cortina EDC CDR 10G Ethernet PHY
  "DAVICOM_PHY" = no; # Davicom PHYs
  "ICPLUS_PHY" = no; # ICPlus PHYs
  "LXT_PHY" = no; # Intel LXT PHYs
  "INTEL_XWAY_PHY" = no; # Intel XWAY PHYs
  "LSI_ET1011C_PHY" = no; # LSI ET1011C PHY
  "MARVELL_PHY" = no; # Marvell Alaska PHYs
  "MARVELL_10G_PHY" = no; # Marvell Alaska 10Gbit PHYs
  "MICREL_PHY" = no; # Micrel PHYs
  "MICROCHIP_PHY" = no; # Microchip PHYs
  "MICROCHIP_T1_PHY" = no; # Microchip T1 PHYs
  "MICROSEMI_PHY" = no; # Microsemi PHYs
  "NATIONAL_PHY" = no; # National Semiconductor PHYs
  "NXP_TJA11XX_PHY" = no; # NXP TJA11xx PHYs support
  "QSEMI_PHY" = no; # Quality Semiconductor PHYs
  "REALTEK_PHY" = no; # Realtek PHYs
  "RENESAS_PHY" = no; # Renesas PHYs
  "ROCKCHIP_PHY" = no; # Rockchip Ethernet PHYs
  "SMSC_PHY" = no; # SMSC PHYs
  "STE10XP" = no; # STMicroelectronics STe10Xp PHYs
  "TERANETICS_PHY" = no; # Teranetics PHYs
  "DP83822_PHY" = no; # Texas Instruments DP83822/825/826 PHYs
  "DP83TC811_PHY" = no; # Texas Instruments DP83TC811 PHY
  "DP83848_PHY" = no; # Texas Instruments DP83848 PHY
  "DP83867_PHY" = no; # Texas Instruments DP83867 Gigabit PHY
  "DP83869_PHY" = no; # Texas Instruments DP83869 Gigabit PHY
  "VITESSE_PHY" = no; # Vitesse PHYs
  "XILINX_GMII2RGMII" = no; # Xilinx GMII2RGMII converter driver
  "MICREL_KS8995MA" = no; # Micrel KS8995MA 5-ports 10/100 managed Ethernet switch
  "MDIO_DEVICE" = yes; # MDIO bus device drivers
  "MDIO_BITBANG" = no; # Bitbanged MDIO buses
  "MDIO_BCM_UNIMAC" = no; # Broadcom UniMAC MDIO bus controller
  "MDIO_HISI_FEMAC" = no; # Hisilicon FEMAC MDIO bus controller
  "MDIO_MVUSB" = no; # Marvell USB to MDIO Adapter
  "MDIO_MSCC_MIIM" = no; # Microsemi MIIM interface support
  "MDIO_OCTEON" = no; # Octeon and some ThunderX SOCs MDIO buses
  "MDIO_IPQ4019" = no; # Qualcomm IPQ4019 MDIO interface support
  "MDIO_IPQ8064" = no; # Qualcomm IPQ8064 MDIO interface support
  "MDIO_BUS_MUX_GPIO" = no; # GPIO controlled MDIO bus multiplexers
  "MDIO_BUS_MUX_MULTIPLEXER" = no; # MDIO bus multiplexer using kernel multiplexer subsystem
  "MDIO_BUS_MUX_MMIOREG" = no; # MMIO device-controlled MDIO bus multiplexers

  #### PCS device drivers
  "PCS_XPCS" = yes; # Synopsys DesignWare XPCS controller
  #### end of PCS device drivers

  "PPP" = no; # PPP (point-to-point protocol) support
  "SLIP" = no; # SLIP (serial line) support
  "USB_NET_DRIVERS" = yes; # USB Network Adapters
  "WLAN" = yes; # Wireless LAN
  "WIRELESS_WDS" = no; # mac80211-based legacy WDS support
  "WLAN_VENDOR_ADMTEK" = no; # ADMtek devices
  "WLAN_VENDOR_ATH" = no; # Atheros/Qualcomm devices
  "WLAN_VENDOR_ATMEL" = no; # Atmel devices
  "WLAN_VENDOR_BROADCOM" = no; # Broadcom devices
  "WLAN_VENDOR_CISCO" = no; # Cisco devices
  "WLAN_VENDOR_INTEL" = no; # Intel devices
  "WLAN_VENDOR_INTERSIL" = no; # Intersil devices
  "WLAN_VENDOR_MARVELL" = no; # Marvell devices
  "WLAN_VENDOR_MEDIATEK" = no; # MediaTek devices
  "WLAN_VENDOR_MICROCHIP" = yes; # Microchip devices
  "WILC1000_SDIO" = no; # Atmel WILC1000 SDIO (WiFi only)
  "WILC1000_SPI" = no; # Atmel WILC1000 SPI (WiFi only)
  "WLAN_VENDOR_RALINK" = no; # Ralink devices
  "WLAN_VENDOR_REALTEK" = yes; # Realtek devices
  "RTL8188FU" = no; # Realtek 8188F USB WiFi
  "RTL8189FS" = no; # Realtek 8189F SDIO WiFi
  "RTL8723DS" = no; # Realtek 8723D SDIO or SPI WiFi
  "RTL8821CS" = no; # Realtek 8821C SDIO or SPI WiFi
  "WLAN_VENDOR_RSI" = no; # Redpine Signals Inc devices
  "WLAN_VENDOR_ST" = no; # STMicroelectronics devices
  "WLAN_VENDOR_TI" = no; # Texas Instrument devices
  "WLAN_VENDOR_ZYDAS" = no; # ZyDAS devices
  "WLAN_VENDOR_QUANTENNA" = yes; # Quantenna wireless cards support
  "WLAN_VENDOR_ICOMMSEMI" = yes; # ICOMMSEMI devices
  "SV6115" = no; # ICOMMSEMI SV6115 USB WiFi
  "WLAN_VENDOR_AICSEMI" = yes; # AICSEMI devices
  "AIC8800" = no; # AIC wireless Support
  "USB_NET_RNDIS_WLAN" = no; # Wireless RNDIS USB support
  "VIRT_WIFI" = no; # Wifi wrapper for ethernet drivers
  "WAN" = no; # Wan interfaces support
  "NETDEVSIM" = no; # Simulated networking device
  "NET_FAILOVER" = no; # Failover driver
  "ISDN" = no; # ISDN support
  "NVM" = no; # Open-Channel SSD target support

  ### Device Drivers -> Input device support
  "INPUT" = yes; # Generic input layer (needed for keyboard, mouse, ...)
  "INPUT_FF_MEMLESS" = no; # Support for memoryless force-feedback devices
  "INPUT_POLLDEV" = no; # Polled input device skeleton
  "INPUT_SPARSEKMAP" = no; # Sparse keymap support library
  "INPUT_MATRIXKMAP" = no; # Matrix keymap support library
  "INPUT_MOUSEDEV" = yes; # Mouse interface
  "INPUT_MOUSEDEV_PSAUX" = yes; # Provide legacy /dev/psaux device
  "INPUT_MOUSEDEV_SCREEN_X" = freeform "1024"; # Horizontal screen resolution
  "INPUT_MOUSEDEV_SCREEN_Y" = freeform "768"; # Vertical screen resolution
  "INPUT_JOYDEV" = no; # Joystick interface
  "INPUT_EVDEV" = yes; # Event interface
  "INPUT_EVBUG" = no; # Event debugging
  "INPUT_KEYBOARD" = yes; # Keyboards
  "KEYBOARD_ADP5588" = no; # ADP5588/87 I2C QWERTY Keypad and IO Expander
  "KEYBOARD_ADP5589" = no; # ADP5585/ADP5589 I2C QWERTY Keypad and IO Expander
  "KEYBOARD_ATKBD" = yes; # AT keyboard
  "KEYBOARD_QT1050" = no; # Microchip AT42QT1050 Touch Sensor Chip
  "KEYBOARD_QT1070" = no; # Atmel AT42QT1070 Touch Sensor Chip
  "KEYBOARD_QT2160" = no; # Atmel AT42QT2160 Touch Sensor Chip
  "KEYBOARD_DLINK_DIR685" = no; # D-Link DIR-685 touchkeys support
  "KEYBOARD_LKKBD" = no; # DECstation/VAXstation LK201/LK401 keyboard
  "KEYBOARD_GPIO" = no; # GPIO Buttons
  "KEYBOARD_GPIO_POLLED" = no; # Polled GPIO buttons
  "KEYBOARD_TCA6416" = no; # TCA6416/TCA6408A Keypad Support
  "KEYBOARD_TCA8418" = no; # TCA8418 Keypad Support
  "KEYBOARD_MATRIX" = no; # GPIO driven matrix keypad support
  "KEYBOARD_LM8333" = no; # LM8333 keypad chip
  "KEYBOARD_MAX7359" = no; # Maxim MAX7359 Key Switch Controller
  "KEYBOARD_MCS" = no; # MELFAS MCS Touchkey
  "KEYBOARD_MPR121" = no; # Freescale MPR121 Touchkey
  "KEYBOARD_NEWTON" = no; # Newton keyboard
  "KEYBOARD_OPENCORES" = no; # OpenCores Keyboard Controller
  "KEYBOARD_SAMSUNG" = no; # Samsung keypad support
  "KEYBOARD_STOWAWAY" = no; # Stowaway keyboard
  "KEYBOARD_SUNKBD" = no; # Sun Type 4 and Type 5 keyboard
  "KEYBOARD_OMAP4" = no; # TI OMAP4+ keypad support
  "KEYBOARD_XTKBD" = no; # XT keyboard
  "KEYBOARD_CAP11XX" = no; # Microchip CAP11XX based touch sensors
  "KEYBOARD_BCM" = no; # Broadcom keypad driver
  "INPUT_MOUSE" = yes; # Mice
  "MOUSE_PS2" = yes; # PS/2 mouse
  "MOUSE_PS2_ALPS" = yes; # ALPS PS/2 mouse protocol extension
  "MOUSE_PS2_BYD" = yes; # BYD PS/2 mouse protocol extension
  "MOUSE_PS2_LOGIPS2PP" = yes; # Logitech PS/2++ mouse protocol extension
  "MOUSE_PS2_SYNAPTICS" = yes; # Synaptics PS/2 mouse protocol extension
  "MOUSE_PS2_SYNAPTICS_SMBUS" = yes; # Synaptics PS/2 SMbus companion
  "MOUSE_PS2_CYPRESS" = yes; # Cypress PS/2 mouse protocol extension
  "MOUSE_PS2_TRACKPOINT" = yes; # IBM Trackpoint PS/2 mouse protocol extension
  "MOUSE_PS2_ELANTECH" = no; # Elantech PS/2 protocol extension
  "MOUSE_PS2_SENTELIC" = no; # Sentelic Finger Sensing Pad PS/2 protocol extension
  "MOUSE_PS2_TOUCHKIT" = no; # eGalax TouchKit PS/2 protocol extension
  "MOUSE_PS2_FOCALTECH" = yes; # FocalTech PS/2 mouse protocol extension
  "MOUSE_SERIAL" = no; # Serial mouse
  "MOUSE_APPLETOUCH" = no; # Apple USB Touchpad support
  "MOUSE_BCM5974" = no; # Apple USB BCM5974 Multitouch trackpad support
  "MOUSE_CYAPA" = no; # Cypress APA I2C Trackpad support
  "MOUSE_ELAN_I2C" = no; # ELAN I2C Touchpad support
  "MOUSE_VSXXXAA" = no; # DEC VSXXX-AA/GA mouse and VSXXX-AB tablet
  "MOUSE_GPIO" = no; # GPIO mouse
  "MOUSE_SYNAPTICS_I2C" = no; # Synaptics I2C Touchpad support
  "MOUSE_SYNAPTICS_USB" = no; # Synaptics USB device support
  "INPUT_JOYSTICK" = no; # Joysticks/Gamepads
  "INPUT_TABLET" = no; # Tablets
  "INPUT_TOUCHSCREEN" = no; # Touchscreens
  "INPUT_MISC" = no; # Miscellaneous devices
  "RMI4_CORE" = no; # Synaptics RMI4 bus support

  #### Device Drivers -> Input device support -> Hardware I/O ports
  "SERIO" = yes; # Serial I/O support
  "SERIO_SERPORT" = yes; # Serial port line discipline
  "SERIO_LIBPS2" = yes; # PS/2 driver library
  "SERIO_RAW" = no; # Raw access to serio ports
  "SERIO_ALTERA_PS2" = no; # Altera UP PS/2 controller
  "SERIO_PS2MULT" = no; # TQC PS/2 multiplexer
  "SERIO_ARC_PS2" = no; # ARC PS/2 support
  "SERIO_APBPS2" = no; # GRLIB APBPS2 PS/2 keyboard/mouse controller
  "SERIO_GPIO_PS2" = no; # GPIO PS/2 bit banging driver
  "USERIO" = no; # User space serio port driver support
  "GAMEPORT" = no; # Gameport support
  #### Device Drivers -> Input device support: end of Hardware I/O ports
  ### Device Drivers: end of Input device support

  ### Device Drivers -> Character devices
  "TTY" = yes; # Enable TTY
  "VT" = no; # Virtual terminal
  "UNIX98_PTYS" = yes; # Unix98 PTY support
  "LEGACY_PTYS" = no; # Legacy (BSD) PTY support
  "LDISC_AUTOLOAD" = yes; # Automatically load TTY Line Disciplines

  ##### Serial drivers
  "SERIAL_8250" = yes; # 8250/16550 and compatible serial support
  "SERIAL_8250_DEPRECATED_OPTIONS" = yes; # Support 8250_core.* kernel options (DEPRECATED)
  "SERIAL_8250_16550A_VARIANTS" = yes; # Support for variants of the 16550A serial port
  "SERIAL_8250_FINTEK" = no; # Support for Fintek F81216A LPC to 4 UART RS485 API
  "SERIAL_8250_CONSOLE" = yes; # Console on 8250/16550 and compatible serial port
  "SERIAL_8250_DMA" = yes; # DMA support for 16550 compatible UART controllers
  "SERIAL_8250_NR_UARTS" = freeform "5"; # Maximum number of 8250/16550 serial ports
  "SERIAL_8250_RUNTIME_UARTS" = freeform "5"; # Number of 8250/16550 serial ports to register at runtime
  "SERIAL_8250_EXTENDED" = no; # Extended 8250/16550 serial driver options
  "SERIAL_8250_ASPEED_VUART" = no; # Aspeed Virtual UART
  "SERIAL_8250_DW" = yes; # Support for Synopsys DesignWare 8250 quirks
  "SERIAL_8250_RT288X" = no; # Ralink RT288x/RT305x/RT3662/RT3883 serial port support
  "SERIAL_OF_PLATFORM" = no; # Devicetree based probing for 8250 ports
  "SERIAL_EARLYCON_RISCV_SBI" = yes; # Early console using RISC-V SBI
  "SERIAL_MAX3100" = no; # MAX3100 support
  "SERIAL_MAX310X" = no; # MAX310X support
  "SERIAL_UARTLITE" = no; # Xilinx uartlite serial port support
  "SERIAL_SIFIVE" = no; # SiFive UART support
  "SERIAL_SCCNXP" = no; # SCCNXP serial port support
  "SERIAL_SC16IS7XX" = no; # SC16IS7xx serial support
  "SERIAL_ALTERA_JTAGUART" = no; # Altera JTAG UART support
  "SERIAL_ALTERA_UART" = no; # Altera UART support
  "SERIAL_IFX6X60" = no; # SPI protocol driver for Infineon 6x60 modem (EXPERIMENTAL)
  "SERIAL_XILINX_PS_UART" = no; # Cadence (Xilinx Zynq) UART support
  "SERIAL_ARC" = no; # ARC UART driver support
  "SERIAL_FSL_LPUART" = no; # Freescale lpuart serial port support
  "SERIAL_FSL_LINFLEXUART" = no; # Freescale LINFlexD UART serial port support
  "SERIAL_CONEXANT_DIGICOLOR" = no; # Conexant Digicolor CX92xxx USART serial port support
  "SERIAL_SPRD" = no; # Support for Spreadtrum serial
  ##### end of Serial drivers

  "SERIAL_NONSTANDARD" = no; # Non-standard serial port support
  "N_GSM" = no; # GSM MUX line discipline support (EXPERIMENTAL)
  "NULL_TTY" = no; # NULL TTY driver
  "TRACE_SINK" = no; # Trace data sink for MIPI P1149.7 cJTAG standard
  "HVC_RISCV_SBI" = no; # RISC-V SBI console support
  "SERIAL_DEV_BUS" = no; # Serial device bus
  "TTY_PRINTK" = no; # TTY driver to output user messages via printk
  "VIRTIO_CONSOLE" = no; # Virtio console
  "IPMI_HANDLER" = no; # IPMI top-level message handler
  "HW_RANDOM" = yes; # Hardware Random Number Generator Core support
  "HW_RANDOM_TIMERIOMEM" = no; # Timer IOMEM HW Random Number Generator support
  "HW_RANDOM_BA431" = no; # Silex Insight BA431 Random Number Generator support
  "HW_RANDOM_CCTRNG" = no; # Arm CryptoCell True Random Number Generator support
  "HW_RANDOM_XIPHERA" = no; # Xiphera FPGA based True Random Number Generator support
  "DEVMEM" = yes; # /dev/mem virtual device support
  "DEVKMEM" = no; # /dev/kmem virtual device support
  "RAW_DRIVER" = no; # RAW driver (/dev/raw/rawN)
  "TCG_TPM" = no; # TPM Hardware Support
  "XILLYBUS" = no; # Xillybus generic FPGA interface
  ### Device Drivers: end of Character devices

  "RANDOM_TRUST_BOOTLOADER" = no; # Trust the bootloader to initialize Linux's CRNG

  ### Device Drivers -> I2C support
  "I2C" = yes; # I2C support
  "I2C_COMPAT" = yes; # Enable compatibility bits for old user-space
  "I2C_CHARDEV" = yes; # I2C device interface
  "I2C_MUX" = yes; # I2C bus multiplexing support

  ###### Multiplexer I2C Chip support
  "I2C_ARB_GPIO_CHALLENGE" = no; # GPIO-based I2C arbitration
  "I2C_MUX_GPIO" = no; # GPIO-based I2C multiplexer
  "I2C_MUX_GPMUX" = no; # General Purpose I2C multiplexer
  "I2C_MUX_LTC4306" = no; # LTC LTC4306/5 I2C multiplexer
  "I2C_MUX_PCA9541" = no; # NXP PCA9541 I2C Master Selector
  "I2C_MUX_PCA954x" = no; # NXP PCA954x and PCA984x I2C Mux/switches
  "I2C_MUX_PINCTRL" = no; # pinctrl-based I2C multiplexer
  "I2C_MUX_REG" = no; # Register-based I2C multiplexer
  "I2C_DEMUX_PINCTRL" = no; # pinctrl-based I2C demultiplexer
  "I2C_MUX_MLXCPLD" = no; # Mellanox CPLD based I2C multiplexer
  ###### end of Multiplexer I2C Chip support

  "I2C_HELPER_AUTO" = yes; # Autoselect pertinent helper modules

  ##### I2C Hardware Bus support
  "I2C_CBUS_GPIO" = no; # CBUS I2C driver
  "I2C_DESIGNWARE_SLAVE" = no; # Synopsys DesignWare Slave
  "I2C_DESIGNWARE_PLATFORM" = yes; # Synopsys DesignWare Platform
  "I2C_DESIGNWARE_ICE" = no; # Synopsys DesignWare for ICE
  "I2C_EMEV2" = no; # EMMA Mobile series I2C adapter
  "I2C_GPIO" = no; # GPIO-based bitbanging I2C
  "I2C_OCORES" = no; # OpenCores I2C Controller
  "I2C_PCA_PLATFORM" = no; # PCA9564/PCA9665 as platform device
  "I2C_RK3X" = no; # Rockchip RK3xxx I2C adapter
  "I2C_SIMTEC" = no; # Simtec Generic I2C interface
  "I2C_XILINX" = no; # Xilinx I2C Controller
  "I2C_DIOLAN_U2C" = no; # Diolan U2C-12 USB adapter
  "I2C_ROBOTFUZZ_OSIF" = no; # RobotFuzz Open Source InterFace USB adapter
  "I2C_TAOS_EVM" = no; # TAOS evaluation module
  "I2C_TINY_USB" = no; # Tiny-USB adapter
  ##### end of I2C Hardware Bus support

  "I2C_STUB" = no; # I2C/SMBus Test Stub
  "I2C_SLAVE" = no; # I2C slave support
  "I2C_DEBUG_CORE" = no; # I2C Core debugging messages
  "I2C_DEBUG_ALGO" = no; # I2C Algorithm debugging messages
  "I2C_DEBUG_BUS" = no; # I2C Bus debugging messages
  ### Device Drivers: end of I2C support

  "I3C" = no; # I3C support
  "SPI" = yes; # SPI support
  "SPI_DEBUG" = no; # Debug support for SPI drivers
  "SPI_MEM" = yes; # SPI memory extension
  "SPI_ALTERA" = no; # Altera SPI Controller
  "SPI_AXI_SPI_ENGINE" = no; # Analog Devices AXI SPI Engine controller
  "SPI_BITBANG" = no; # Utilities for Bitbanging SPI masters
  "SPI_CADENCE" = no; # Cadence SPI controller
  "SPI_DESIGNWARE" = yes; # DesignWare SPI controller core support
  "SPI_DW_DMA" = no; # DMA support for DW SPI controller
  "SPI_DW_MMIO" = yes; # Memory-mapped io interface driver for DW SPI core
  "SPI_NXP_FLEXSPI" = no; # NXP Flex SPI controller
  "SPI_GPIO" = no; # GPIO-based bitbanging SPI Master
  "SPI_FSL_SPI" = no; # Freescale SPI controller and Aeroflex Gaisler GRLIB SPI controller
  "SPI_OC_TINY" = no; # OpenCores tiny SPI
  "SPI_ROCKCHIP" = no; # Rockchip SPI controller driver
  "SPI_SC18IS602" = no; # NXP SC18IS602/602B/603 I2C to SPI bridge
  "SPI_SIFIVE" = no; # SiFive SPI controller
  "SPI_MXIC" = no; # Macronix MX25F0A SPI controller
  "SPI_XCOMM" = no; # Analog Devices AD-FMCOMMS1-EBZ SPI-I2C-bridge driver
  "SPI_XILINX" = no; # Xilinx SPI controller common module
  "SPI_ZYNQMP_GQSPI" = no; # Xilinx ZynqMP GQSPI controller
  "SPI_AMD" = no; # AMD SPI controller
  "SPI_MUX" = no; # SPI multiplexer support
  "SPI_SPIDEV" = yes; # User mode SPI device driver support
  "SPI_LOOPBACK_TEST" = no; # spi loopback test framework support
  "SPI_TLE62X0" = no; # Infineon TLE62X0 (for power switching)
  "SPI_SLAVE" = no; # SPI slave protocol handlers
  "SPMI" = no; # SPMI support
  "HSI" = no; # HSI support
  "PPS" = no; # PPS support

  ### Device Drivers -> PTP clock support
  "PTP_1588_CLOCK" = no; # PTP clock support
  ### Device Drivers: end of PTP clock support

  "PINCTRL" = yes; # Pin controllers
  "DEBUG_PINCTRL" = no; # Debug PINCTRL calls
  "PINCTRL_MCP23S08" = no; # Microchip MCP23xxx I/O expander
  "PINCTRL_SINGLE" = no; # One-register-per-pin type device tree based pinctrl driver
  "PINCTRL_SX150X" = no; # Semtech SX150x I2C GPIO expander pinctrl driver
  "PINCTRL_STMFX" = no; # STMicroelectronics STMFX GPIO expander pinctrl driver
  "PINCTRL_OCELOT" = no; # Pinctrl driver for the Microsemi Ocelot and Jaguar2 SoCs
  "CVITEK_PINCTRL_CV1835" = yes; # cvitek pinctrl
  "GPIOLIB" = yes; # GPIO Support
  "GPIOLIB_FASTPATH_LIMIT" = freeform "512"; # Maximum number of GPIOs for fast path
  "DEBUG_GPIO" = no; # Debug GPIO calls
  "GPIO_SYSFS" = yes; # /sys/class/gpio/... (sysfs interface)
  "GPIO_CDEV" = yes; # Character device (/dev/gpiochipN) support
  "GPIO_CDEV_V1" = yes; # Support GPIO ABI Version 1

  #### Memory mapped GPIO drivers
  "GPIO_74XX_MMIO" = no; # GPIO driver for 74xx-ICs with MMIO access
  "GPIO_ALTERA" = no; # Altera GPIO
  "GPIO_CADENCE" = no; # Cadence GPIO support
  "GPIO_DWAPB" = yes; # Synopsys DesignWare APB GPIO driver
  "GPIO_FTGPIO010" = no; # Faraday FTGPIO010 GPIO
  "GPIO_GENERIC_PLATFORM" = no; # Generic memory-mapped GPIO controller support (MMIO platform device)
  "GPIO_GRGPIO" = no; # Aeroflex Gaisler GRGPIO support
  "GPIO_HLWD" = no; # Nintendo Wii (Hollywood) GPIO
  "GPIO_LOGICVC" = no; # Xylon LogiCVC GPIO support
  "GPIO_MB86S7X" = no; # GPIO support for Fujitsu MB86S7x Platforms
  "GPIO_SAMA5D2_PIOBU" = no; # SAMA5D2 PIOBU GPIO support
  "GPIO_SIFIVE" = no; # SiFive GPIO support
  "GPIO_SYSCON" = no; # GPIO based on SYSCON
  "GPIO_XILINX" = no; # Xilinx GPIO support
  "GPIO_AMD_FCH" = no; # GPIO support for AMD Fusion Controller Hub (G-series SOCs)
  #### end of Memory mapped GPIO drivers

  #### I2C GPIO expanders
  "GPIO_ADP5588" = no; # ADP5588 I2C GPIO expander
  "GPIO_ADNP" = no; # Avionic Design N-bit GPIO expander
  "GPIO_GW_PLD" = no; # Gateworks PLD GPIO Expander
  "GPIO_MAX7300" = no; # Maxim MAX7300 GPIO expander
  "GPIO_MAX732X" = no; # MAX7319, MAX7320-7327 I2C Port Expanders
  "GPIO_PCA953X" = no; # PCA95[357]x, PCA9698, TCA64xx, and MAX7310 I/O ports
  "GPIO_PCA9570" = no; # PCA9570 4-Bit I2C GPO expander
  "GPIO_PCF857X" = no; # PCF857x, PCA{85,96}7x, and MAX732[89] I2C GPIO expanders
  "GPIO_TPIC2810" = no; # TPIC2810 8-Bit I2C GPO expander
  #### end of I2C GPIO expanders

  #### SPI GPIO expanders
  "GPIO_74X164" = no; # 74x164 serial-in/parallel-out 8-bits shift register
  "GPIO_MAX3191X" = no; # Maxim MAX3191x industrial serializer
  "GPIO_MAX7301" = no; # Maxim MAX7301 GPIO expander
  "GPIO_MC33880" = no; # Freescale MC33880 high-side/low-side switch
  "GPIO_PISOSR" = no; # Generic parallel-in/serial-out shift register
  "GPIO_XRA1403" = no; # EXAR XRA1403 16-bit GPIO expander
  #### end of SPI GPIO expanders
  "GPIO_AGGREGATOR" = no; # GPIO Aggregator
  "GPIO_MOCKUP" = no; # GPIO Testing Driver
  "W1" = no; # Dallas's 1-wire support
  "POWER_RESET" = yes; # Board level reset or power off
  "POWER_RESET_GPIO" = no; # GPIO power-off driver
  "POWER_RESET_GPIO_RESTART" = no; # GPIO restart driver
  "POWER_RESET_LTC2952" = no; # LTC2952 PowerPath power-off driver
  "POWER_RESET_RESTART" = no; # Restart power-off driver
  "POWER_RESET_SYSCON" = no; # Generic SYSCON regmap reset driver
  "POWER_RESET_SYSCON_POWEROFF" = no; # Generic SYSCON regmap poweroff driver
  "SYSCON_REBOOT_MODE" = no; # Generic SYSCON regmap reboot mode driver
  "NVMEM_REBOOT_MODE" = no; # Generic NVMEM reboot mode driver
  "POWER_SUPPLY" = no; # Power supply class support
  "HWMON" = yes; # Hardware Monitoring support
  "HWMON_DEBUG_CHIP" = no; # Hardware Monitoring Chip debugging messages
  "SENSORS_AD7314" = no; # Analog Devices AD7314 and compatibles
  "SENSORS_AD7414" = no; # Analog Devices AD7414
  "SENSORS_AD7418" = no; # Analog Devices AD7416, AD7417 and AD7418
  "SENSORS_ADM1021" = no; # Analog Devices ADM1021 and compatibles
  "SENSORS_ADM1025" = no; # Analog Devices ADM1025 and compatibles
  "SENSORS_ADM1026" = no; # Analog Devices ADM1026 and compatibles
  "SENSORS_ADM1029" = no; # Analog Devices ADM1029
  "SENSORS_ADM1031" = no; # Analog Devices ADM1031 and compatibles
  "SENSORS_ADM1177" = no; # Analog Devices ADM1177 and compatibles
  "SENSORS_ADM9240" = no; # Analog Devices ADM9240 and compatibles
  "SENSORS_ADT7310" = no; # Analog Devices ADT7310/ADT7320
  "SENSORS_ADT7410" = no; # Analog Devices ADT7410/ADT7420
  "SENSORS_ADT7411" = no; # Analog Devices ADT7411
  "SENSORS_ADT7462" = no; # Analog Devices ADT7462
  "SENSORS_ADT7470" = no; # Analog Devices ADT7470
  "SENSORS_ADT7475" = no; # Analog Devices ADT7473, ADT7475, ADT7476 and ADT7490
  "SENSORS_AS370" = no; # Synaptics AS370 SoC hardware monitoring driver
  "SENSORS_ASC7621" = no; # Andigilog aSC7621
  "SENSORS_AXI_FAN_CONTROL" = no; # Analog Devices FAN Control HDL Core driver
  "SENSORS_ASPEED" = no; # ASPEED AST2400/AST2500 PWM and Fan tach driver
  "SENSORS_ATXP1" = no; # Attansic ATXP1 VID controller
  "SENSORS_CORSAIR_CPRO" = no; # Corsair Commander Pro controller
  "SENSORS_DS620" = no; # Dallas Semiconductor DS620
  "SENSORS_DS1621" = no; # Dallas Semiconductor DS1621 and compatibles
  "SENSORS_F71805F" = no; # Fintek F71805F/FG, F71806F/FG and F71872F/FG
  "SENSORS_F71882FG" = no; # Fintek F71882FG and compatibles
  "SENSORS_F75375S" = no; # Fintek F75375S/SP, F75373 and F75387
  "SENSORS_FTSTEUTATES" = no; # Fujitsu Technology Solutions sensor chip Teutates
  "SENSORS_GL518SM" = no; # Genesys Logic GL518SM
  "SENSORS_GL520SM" = no; # Genesys Logic GL520SM
  "SENSORS_G760A" = no; # GMT G760A
  "SENSORS_G762" = no; # GMT G762 and G763
  "SENSORS_GPIO_FAN" = no; # GPIO fan
  "SENSORS_HIH6130" = no; # Honeywell Humidicon HIH-6130 humidity/temperature sensor
  "SENSORS_IT87" = no; # ITE IT87xx and compatibles
  "SENSORS_JC42" = no; # JEDEC JC42.4 compliant memory module temperature sensors
  "SENSORS_POWR1220" = no; # Lattice POWR1220 Power Monitoring
  "SENSORS_LINEAGE" = no; # Lineage Compact Power Line Power Entry Module
  "SENSORS_LTC2945" = no; # Linear Technology LTC2945
  "SENSORS_LTC2947_I2C" = no; # Analog Devices LTC2947 High Precision Power and Energy Monitor over I2C
  "SENSORS_LTC2947_SPI" = no; # Analog Devices LTC2947 High Precision Power and Energy Monitor over SPI
  "SENSORS_LTC2990" = no; # Linear Technology LTC2990
  "SENSORS_LTC4151" = no; # Linear Technology LTC4151
  "SENSORS_LTC4215" = no; # Linear Technology LTC4215
  "SENSORS_LTC4222" = no; # Linear Technology LTC4222
  "SENSORS_LTC4245" = no; # Linear Technology LTC4245
  "SENSORS_LTC4260" = no; # Linear Technology LTC4260
  "SENSORS_LTC4261" = no; # Linear Technology LTC4261
  "SENSORS_MAX1111" = no; # Maxim MAX1111 Serial 8-bit ADC chip and compatibles
  "SENSORS_MAX16065" = no; # Maxim MAX16065 System Manager and compatibles
  "SENSORS_MAX1619" = no; # Maxim MAX1619 sensor chip
  "SENSORS_MAX1668" = no; # Maxim MAX1668 and compatibles
  "SENSORS_MAX197" = no; # Maxim MAX197 and compatibles
  "SENSORS_MAX31722" = no; # MAX31722 temperature sensor
  "SENSORS_MAX31730" = no; # MAX31730 temperature sensor
  "SENSORS_MAX6621" = no; # Maxim MAX6621 sensor chip
  "SENSORS_MAX6639" = no; # Maxim MAX6639 sensor chip
  "SENSORS_MAX6642" = no; # Maxim MAX6642 sensor chip
  "SENSORS_MAX6650" = no; # Maxim MAX6650 sensor chip
  "SENSORS_MAX6697" = no; # Maxim MAX6697 and compatibles
  "SENSORS_MAX31790" = no; # Maxim MAX31790 sensor chip
  "SENSORS_MCP3021" = no; # Microchip MCP3021 and compatibles
  "SENSORS_TC654" = no; # Microchip TC654/TC655 and compatibles
  "SENSORS_MR75203" = no; # Moortec Semiconductor MR75203 PVT Controller
  "SENSORS_ADCXX" = no; # National Semiconductor ADCxxxSxxx
  "SENSORS_LM63" = no; # National Semiconductor LM63 and compatibles
  "SENSORS_LM70" = no; # National Semiconductor LM70 and compatibles
  "SENSORS_LM73" = no; # National Semiconductor LM73
  "SENSORS_LM75" = no; # National Semiconductor LM75 and compatibles
  "SENSORS_LM77" = no; # National Semiconductor LM77
  "SENSORS_LM78" = no; # National Semiconductor LM78 and compatibles
  "SENSORS_LM80" = no; # National Semiconductor LM80 and LM96080
  "SENSORS_LM83" = no; # National Semiconductor LM83 and compatibles
  "SENSORS_LM85" = no; # National Semiconductor LM85 and compatibles
  "SENSORS_LM87" = no; # National Semiconductor LM87 and compatibles
  "SENSORS_LM90" = no; # National Semiconductor LM90 and compatibles
  "SENSORS_LM92" = no; # National Semiconductor LM92 and compatibles
  "SENSORS_LM93" = no; # National Semiconductor LM93 and compatibles
  "SENSORS_LM95234" = no; # National Semiconductor LM95234 and compatibles
  "SENSORS_LM95241" = no; # National Semiconductor LM95241 and compatibles
  "SENSORS_LM95245" = no; # National Semiconductor LM95245 and compatibles
  "SENSORS_PC87360" = no; # National Semiconductor PC87360 family
  "SENSORS_PC87427" = no; # National Semiconductor PC87427
  "SENSORS_NTC_THERMISTOR" = no; # NTC thermistor support from Murata
  "SENSORS_NCT6683" = no; # Nuvoton NCT6683D
  "SENSORS_NCT6775" = no; # Nuvoton NCT6775F and compatibles
  "SENSORS_NCT7802" = no; # Nuvoton NCT7802Y
  "SENSORS_NCT7904" = no; # Nuvoton NCT7904
  "SENSORS_NPCM7XX" = no; # Nuvoton NPCM750 and compatible PWM and Fan controllers
  "SENSORS_PCF8591" = no; # Philips PCF8591 ADC/DAC
  "PMBUS" = no; # PMBus support
  "SENSORS_PWM_FAN" = no; # PWM fan
  "SENSORS_SHT15" = no; # Sensiron humidity and temperature sensors. SHT15 and compat.
  "SENSORS_SHT21" = no; # Sensiron humidity and temperature sensors. SHT21 and compat.
  "SENSORS_SHT3x" = no; # Sensiron humidity and temperature sensors. SHT3x and compat.
  "SENSORS_SHTC1" = no; # Sensiron humidity and temperature sensors. SHTC1 and compat.
  "SENSORS_DME1737" = no; # SMSC DME1737, SCH311x and compatibles
  "SENSORS_EMC1403" = no; # SMSC EMC1403/23 thermal sensor
  "SENSORS_EMC2103" = no; # SMSC EMC2103
  "SENSORS_EMC6W201" = no; # SMSC EMC6W201
  "SENSORS_SMSC47M1" = no; # SMSC LPC47M10x and compatibles
  "SENSORS_SMSC47M192" = no; # SMSC LPC47M192 and compatibles
  "SENSORS_SMSC47B397" = no; # SMSC LPC47B397-NC
  "SENSORS_SCH5627" = no; # SMSC SCH5627
  "SENSORS_SCH5636" = no; # SMSC SCH5636
  "SENSORS_STTS751" = no; # ST Microelectronics STTS751
  "SENSORS_SMM665" = no; # Summit Microelectronics SMM665
  "SENSORS_ADC128D818" = no; # Texas Instruments ADC128D818
  "SENSORS_ADS7828" = no; # Texas Instruments ADS7828 and compatibles
  "SENSORS_ADS7871" = no; # Texas Instruments ADS7871 A/D converter
  "SENSORS_AMC6821" = no; # Texas Instruments AMC6821
  "SENSORS_INA209" = no; # TI / Burr Brown INA209
  "SENSORS_INA2XX" = no; # Texas Instruments INA219 and compatibles
  "SENSORS_INA3221" = no; # Texas Instruments INA3221 Triple Power Monitor
  "SENSORS_TC74" = no; # Microchip TC74
  "SENSORS_THMC50" = no; # Texas Instruments THMC50 / Analog Devices ADM1022
  "SENSORS_TMP102" = no; # Texas Instruments TMP102
  "SENSORS_TMP103" = no; # Texas Instruments TMP103
  "SENSORS_TMP108" = no; # Texas Instruments TMP108
  "SENSORS_TMP401" = no; # Texas Instruments TMP401 and compatibles
  "SENSORS_TMP421" = no; # Texas Instruments TMP421 and compatible
  "SENSORS_TMP513" = no; # Texas Instruments TMP513 and compatibles
  "SENSORS_VT1211" = no; # VIA VT1211
  "SENSORS_W83773G" = no; # Nuvoton W83773G
  "SENSORS_W83781D" = no; # Winbond W83781D, W83782D, W83783S, Asus AS99127F
  "SENSORS_W83791D" = no; # Winbond W83791D
  "SENSORS_W83792D" = no; # Winbond W83792D
  "SENSORS_W83793" = no; # Winbond W83793
  "SENSORS_W83795" = no; # Winbond/Nuvoton W83795G/ADG
  "SENSORS_W83L785TS" = no; # Winbond W83L785TS-S
  "SENSORS_W83L786NG" = no; # Winbond W83L786NG, W83L786NR
  "SENSORS_W83627HF" = no; # Winbond W83627HF, W83627THF, W83637HF, W83687THF, W83697HF
  "SENSORS_W83627EHF" = no; # Winbond W83627EHF/EHG/DHG/UHG, W83667HG
  "THERMAL" = yes; # Thermal drivers
  "THERMAL_NETLINK" = yes; # Thermal netlink management
  "THERMAL_STATISTICS" = no; # Thermal state transition statistics
  "THERMAL_EMERGENCY_POWEROFF_DELAY_MS" = freeform "0"; # Emergency poweroff delay in milli-seconds
  "THERMAL_HWMON" = yes; # Expose thermal sensors as hwmon device
  "THERMAL_OF" = yes; # APIs to parse thermal data out of device tree
  "THERMAL_WRITABLE_TRIPS" = yes; # Enable writable trip points
  "THERMAL_DEFAULT_GOV_STEP_WISE" = yes; # step_wise
  "THERMAL_DEFAULT_GOV_FAIR_SHARE" = no; # fair_share
  "THERMAL_DEFAULT_GOV_USER_SPACE" = no; # user_space
  "THERMAL_GOV_FAIR_SHARE" = no; # Fair-share thermal governor
  "THERMAL_GOV_STEP_WISE" = yes; # Step_wise thermal governor
  "THERMAL_GOV_BANG_BANG" = no; # Bang Bang thermal governor
  "THERMAL_GOV_USER_SPACE" = no; # User_space thermal governor
  "CPU_THERMAL" = no; # Generic cpu cooling support
  "THERMAL_EMULATION" = yes; # Thermal emulation mode support
  "THERMAL_MMIO" = no; # Generic Thermal MMIO driver
  "CV181X_THERMAL" = yes; # Temperature sensor driver for CVITEK CV181X
  "WATCHDOG" = yes; # Watchdog Timer Support
  "WATCHDOG_CORE" = yes; # WatchDog Timer Driver Core
  "WATCHDOG_NOWAYOUT" = no; # Disable watchdog shutdown on close
  "WATCHDOG_HANDLE_BOOT_ENABLED" = yes; # Update boot-enabled watchdog until userspace takes over
  "WATCHDOG_OPEN_TIMEOUT" = freeform "0"; # Timeout value for opening watchdog device
  "WATCHDOG_SYSFS" = no; # Read different watchdog information through sysfs
  "WATCHDOG_PRETIMEOUT_GOV" = no; # Enable watchdog pretimeout governors
  "SOFT_WATCHDOG" = no; # Software watchdog
  "GPIO_WATCHDOG" = no; # Watchdog device controlled through GPIO-line
  "XILINX_WATCHDOG" = no; # Xilinx Watchdog timer
  "ZIIRAVE_WATCHDOG" = no; # Zodiac RAVE Watchdog Timer
  "CADENCE_WATCHDOG" = no; # Cadence Watchdog Timer
  "DW_WATCHDOG" = no; # Synopsys DesignWare watchdog
  "MAX63XX_WATCHDOG" = no; # Max63xx watchdog
  "ICE_WDT" = yes; # ICE+ Watchdog
  "MEN_A21_WDT" = no; # MEN A21 VME CPU Carrier Board Watchdog Timer
  "USBPCWATCHDOG" = no; # Berkshire Products USB-PC Watchdog
  "SSB" = no; # Sonics Silicon Backplane support
  "BCMA" = no; # Broadcom specific AMBA

  ### Device Drivers -> Multifunction device drivers
  "MFD_ACT8945A" = no; # Active-semi ACT8945A
  "MFD_AS3711" = no; # AMS AS3711
  "MFD_AS3722" = no; # ams AS3722 Power Management IC
  "PMIC_ADP5520" = no; # Analog Devices ADP5520/01 MFD PMIC Core Support
  "MFD_AAT2870_CORE" = no; # AnalogicTech AAT2870
  "MFD_ATMEL_FLEXCOM" = no; # Atmel Flexcom (Flexible Serial Communication Unit)
  "MFD_ATMEL_HLCDC" = no; # Atmel HLCDC (High-end LCD Controller)
  "MFD_BCM590XX" = no; # Broadcom BCM590xx PMUs
  "MFD_BD9571MWV" = no; # ROHM BD9571MWV PMIC
  "MFD_AXP20X_I2C" = no; # X-Powers AXP series PMICs with I2C
  "MFD_MADERA" = no; # Cirrus Logic Madera codecs
  "PMIC_DA903X" = no; # Dialog Semiconductor DA9030/DA9034 PMIC Support
  "MFD_DA9052_SPI" = no; # Dialog Semiconductor DA9052/53 PMIC variants with SPI
  "MFD_DA9052_I2C" = no; # Dialog Semiconductor DA9052/53 PMIC variants with I2C
  "MFD_DA9055" = no; # Dialog Semiconductor DA9055 PMIC Support
  "MFD_DA9062" = no; # Dialog Semiconductor DA9062/61 PMIC Support
  "MFD_DA9063" = no; # Dialog Semiconductor DA9063 PMIC Support
  "MFD_DA9150" = no; # Dialog Semiconductor DA9150 Charger Fuel-Gauge chip
  "MFD_DLN2" = no; # Diolan DLN2 support
  "MFD_GATEWORKS_GSC" = no; # Gateworks System Controller
  "MFD_MC13XXX_SPI" = no; # Freescale MC13783 and MC13892 SPI interface
  "MFD_MC13XXX_I2C" = no; # Freescale MC13892 I2C interface
  "MFD_MP2629" = no; # Monolithic Power Systems MP2629 ADC and Battery charger
  "MFD_HI6421_PMIC" = no; # HiSilicon Hi6421 PMU/Codec IC
  "HTC_PASIC3" = no; # HTC PASIC3 LED/DS1WM chip support
  "HTC_I2CPLD" = no; # HTC I2C PLD chip support
  "MFD_IQS62X" = no; # Azoteq IQS620A/621/622/624/625 core support
  "MFD_KEMPLD" = no; # Kontron module PLD device
  "MFD_88PM800" = no; # Marvell 88PM800
  "MFD_88PM805" = no; # Marvell 88PM805
  "MFD_88PM860X" = no; # Marvell 88PM8606/88PM8607
  "MFD_MAX14577" = no; # Maxim Semiconductor MAX14577/77836 MUIC + Charger Support
  "MFD_MAX77620" = no; # Maxim Semiconductor MAX77620 and MAX20024 PMIC Support
  "MFD_MAX77650" = no; # Maxim MAX77650/77651 PMIC Support
  "MFD_MAX77686" = no; # Maxim Semiconductor MAX77686/802 PMIC Support
  "MFD_MAX77693" = no; # Maxim Semiconductor MAX77693 PMIC Support
  "MFD_MAX77843" = no; # Maxim Semiconductor MAX77843 PMIC Support
  "MFD_MAX8907" = no; # Maxim Semiconductor MAX8907 PMIC Support
  "MFD_MAX8925" = no; # Maxim Semiconductor MAX8925 PMIC Support
  "MFD_MAX8997" = no; # Maxim Semiconductor MAX8997/8966 PMIC Support
  "MFD_MAX8998" = no; # Maxim Semiconductor MAX8998/National LP3974 PMIC Support
  "MFD_MT6360" = no; # Mediatek MT6360 SubPMIC
  "MFD_MT6397" = no; # MediaTek MT6397 PMIC Support
  "MFD_MENF21BMC" = no; # MEN 14F021P00 Board Management Controller Support
  "EZX_PCAP" = no; # Motorola EZXPCAP Support
  "MFD_CPCAP" = no; # Support for Motorola CPCAP
  "MFD_VIPERBOARD" = no; # Nano River Technologies Viperboard
  "MFD_RETU" = no; # Nokia Retu and Tahvo multi-function device
  "MFD_PCF50633" = no; # NXP PCF50633
  "MFD_RT5033" = no; # Richtek RT5033 Power Management IC
  "MFD_RC5T583" = no; # Ricoh RC5T583 Power Management system device
  "MFD_RK808" = no; # Rockchip RK805/RK808/RK809/RK817/RK818 Power Management Chip
  "MFD_RN5T618" = no; # Ricoh RN5T567/618 PMIC
  "MFD_SEC_CORE" = no; # Samsung Electronics PMIC Series Support
  "MFD_SI476X_CORE" = no; # Silicon Laboratories 4761/64/68 AM/FM radio.
  "MFD_SM501" = no; # Silicon Motion SM501
  "MFD_SKY81452" = no; # Skyworks Solutions SKY81452
  "ABX500_CORE" = no; # ST-Ericsson ABX500 Mixed Signal Circuit register functions
  "MFD_STMPE" = no; # STMicroelectronics STMPE
  "MFD_SYSCON" = yes; # System Controller Register R/W Based on Regmap
  "MFD_TI_AM335X_TSCADC" = no; # TI ADC / Touch Screen chip support
  "MFD_LP3943" = no; # TI/National Semiconductor LP3943 MFD Driver
  "MFD_LP8788" = no; # TI LP8788 Power Management Unit Driver
  "MFD_TI_LMU" = no; # TI Lighting Management Unit driver
  "MFD_PALMAS" = no; # TI Palmas series chips
  "TPS6105X" = no; # TI TPS61050/61052 Boost Converters
  "TPS65010" = no; # TI TPS6501x Power Management chips
  "TPS6507X" = no; # TI TPS6507x Power Management / Touch Screen chips
  "MFD_TPS65086" = no; # TI TPS65086 Power Management Integrated Chips (PMICs)
  "MFD_TPS65090" = no; # TI TPS65090 Power Management chips
  "MFD_TPS65217" = no; # TI TPS65217 Power Management / White LED chips
  "MFD_TI_LP873X" = no; # TI LP873X Power Management IC
  "MFD_TI_LP87565" = no; # TI LP87565 Power Management IC
  "MFD_TPS65218" = no; # TI TPS65218 Power Management chips
  "MFD_TPS6586X" = no; # TI TPS6586x Power Management chips
  "MFD_TPS65910" = no; # TI TPS65910 Power Management chip
  "MFD_TPS65912_I2C" = no; # TI TPS65912 Power Management chip with I2C
  "MFD_TPS65912_SPI" = no; # TI TPS65912 Power Management chip with SPI
  "MFD_TPS80031" = no; # TI TPS80031/TPS80032 Power Management chips
  "TWL4030_CORE" = no; # TI TWL4030/TWL5030/TWL6030/TPS659x0 Support
  "TWL6040_CORE" = no; # TI TWL6040 audio codec
  "MFD_WL1273_CORE" = no; # TI WL1273 FM radio
  "MFD_LM3533" = no; # TI/National Semiconductor LM3533 Lighting Power chip
  "MFD_TC3589X" = no; # Toshiba TC35892 and variants
  "MFD_TQMX86" = no; # TQ-Systems IO controller TQMX86
  "MFD_LOCHNAGAR" = no; # Cirrus Logic Lochnagar Audio Development Board
  "MFD_ARIZONA_I2C" = no; # Cirrus Logic/Wolfson Microelectronics Arizona platform with I2C
  "MFD_ARIZONA_SPI" = no; # Cirrus Logic/Wolfson Microelectronics Arizona platform with SPI
  "MFD_WM8400" = no; # Wolfson Microelectronics WM8400
  "MFD_WM831X_I2C" = no; # Wolfson Microelectronics WM831x/2x PMICs with I2C
  "MFD_WM831X_SPI" = no; # Wolfson Microelectronics WM831x/2x PMICs with SPI
  "MFD_WM8350_I2C" = no; # Wolfson Microelectronics WM8350 with I2C
  "MFD_WM8994" = no; # Wolfson Microelectronics WM8994
  "MFD_ROHM_BD718XX" = no; # ROHM BD71837 Power Management IC
  "MFD_ROHM_BD70528" = no; # ROHM BD70528 Power Management IC
  "MFD_ROHM_BD71828" = no; # ROHM BD71828 Power Management IC
  "MFD_STPMIC1" = no; # Support for STPMIC1 PMIC
  "MFD_STMFX" = no; # Support for STMicroelectronics Multi-Function eXpander (STMFX)
  "MFD_INTEL_M10_BMC" = no; # Intel MAX 10 Board Management Controller
  ### Device Drivers: end of Multifunction device drivers

  "REGULATOR" = no; # Voltage and Current Regulator Support
  "RC_CORE" = no; # Remote Controller support
  "MEDIA_CEC_SUPPORT" = no; # HDMI CEC drivers
  "MEDIA_SUPPORT" = no; # Multimedia support

  ### Device Drivers -> Graphics support
  "DRM" = no; # Direct Rendering Manager (XFree86 4.1.0 and higher DRI support)

  #### Device Drivers -> Graphics support -> Frame buffer Devices
  "FB" = yes; # Support for frame buffer devices
  "FIRMWARE_EDID" = no; # Enable firmware EDID
  "FB_FOREIGN_ENDIAN" = no; # Framebuffer foreign endianness support
  "FB_MODE_HELPERS" = no; # Enable Video Mode Handling Helpers
  "FB_TILEBLITTING" = no; # Enable Tile Blitting Support
  "FB_EFI" = no; # EFI-based Framebuffer Support
  "FB_OPENCORES" = no; # OpenCores VGA/LCD core 2.0 framebuffer support
  "FB_S1D13XXX" = no; # Epson S1D13XXX framebuffer support
  "FB_SMSCUFX" = no; # SMSC UFX6000/7000 USB Framebuffer support
  "FB_UDL" = no; # Displaylink USB Framebuffer support
  "FB_IBM_GXT4500" = no; # Framebuffer support for IBM GXT4000P/4500P/6000P/6500P adaptors
  "FB_VIRTUAL" = no; # Virtual Frame Buffer support (ONLY FOR TESTING!)
  "FB_METRONOME" = no; # E-Ink Metronome/8track controller support
  "FB_SIMPLE" = no; # Simple framebuffer support
  "FB_SSD1307" = no; # Solomon SSD1307 framebuffer support
  "FB_CVITEK" = module; # Cvitek framebuffer support
  #### Device Drivers -> Graphics support: end of Frame buffer Devices

  #### Device Drivers -> Graphics support -> Backlight & LCD device support
  "LCD_CLASS_DEVICE" = no; # Lowlevel LCD controls
  "BACKLIGHT_CLASS_DEVICE" = no; # Lowlevel Backlight controls
  #### Device Drivers -> Graphics support: end of Backlight & LCD device support

  "LOGO" = no; # Bootup logo
  ### Device Drivers: end of Graphics support

  "SOUND" = yes; # Sound card support
  "SND" = yes; # Advanced Linux Sound Architecture
  "SND_OSSEMUL" = no; # Enable OSS Emulation
  "SND_PCM_TIMER" = yes; # PCM timer interface
  "SND_HRTIMER" = no; # HR-timer backend support
  "SND_DYNAMIC_MINORS" = no; # Dynamic device file minor numbers
  "SND_SUPPORT_OLD_API" = no; # Support old ALSA API
  "SND_PROC_FS" = no; # Sound Proc FS Support
  "SND_VERBOSE_PRINTK" = no; # Verbose printk
  "SND_DEBUG" = no; # Debug
  "SND_SEQUENCER" = no; # Sequencer support
  "SND_DRIVERS" = no; # Generic sound devices
  "SND_HDA_PREALLOC_SIZE" = freeform "1"; # Pre-allocated buffer size for HD-audio driver
  "SND_SPI" = no; # SPI sound devices
  "SND_USB" = no; # USB sound devices
  "SND_SOC" = yes; # ALSA for SoC audio support
  "SND_SOC_AMD_ACP" = no; # AMD Audio Coprocessor support
  "SND_ATMEL_SOC" = no; # SoC Audio for the Atmel System-on-Chip
  "SND_BCM63XX_I2S_WHISTLER" = no; # SoC Audio support for the Broadcom BCM63XX I2S module
  "SND_SOC_CV1835_ADAU1372" = no; # Support for the CV1835-ADAU1372 card
  "SND_SOC_CV1835_CV1835PDM" = no; # Support for the CV1835-CV1835PDM card
  "SND_SOC_CV182X_CV182XPDM" = no; # Support for the CV182X-CV182XPDM card
  "SND_SOC_CV1835_CV1835ADC" = no; # Support for the CV1835-CV1835ADC card
  "SND_SOC_CV1835_CV1835DAC" = no; # Support for the CV1835-CV1835ADC card
  "SND_SOC_CV182X_CV182XADC" = no; # Support for the CV182X-CV182XADC card
  "SND_SOC_CV182X_CV182XDAC" = no; # Support for the CV182X-CV182XADC card
  "SND_SOC_CV182XA_CV182XAADC" = yes; # Support for the CV182XA-CV182XAADC card
  "SND_SOC_CV182XA_CV182XADAC" = yes; # Support for the CV182XA-CV182XADAC card
  "SND_CV1835_I2S" = yes; # CVITEK CV1835 I2S Device Driver
  "SND_SOC_CV1835PDM" = no; # CVITEK CV1835 PDM device driver
  "SND_SOC_CV1835ADC" = no; # CVITEK CV1835 ADC device driver
  "SND_SOC_CV182XADC" = no; # CVITEK CV182X ADC device driver
  "SND_SOC_CV182XAADC" = yes; # CVITEK CV182XA ADC device driver
  "SND_SOC_CV1835DAC" = no; # CVITEK CV1835 DAC device driver
  "SND_SOC_CV182XDAC" = no; # CVITEK CV182X DAC device driver
  "SND_SOC_CV182XADAC" = yes; # CVITEK CV182XA DAC device driver
  "SND_SOC_CV1835_CONCURRENT_I2S" = no; # Support concurrent TX and RX by one I2S and the other I2S
  "SND_SOC_CV183x_DUMMY_CARD" = no; # Support concurrent TX and RX by one I2S and the other I2S
  "SND_SOC_CV1835_USE_AUDIO_PLL" = yes; # Use internal audio PLL as I2S clock source
  "CV1835_I2S_SUBSYS" = yes; # cvitek i2s tdm sub-system driver
  "SND_SOC_CV1835_LT9611" = no; # Support for the lt9611 card
  "SND_DESIGNWARE_I2S" = no; # Synopsys I2S Device Driver

  ###### SoC Audio for Freescale CPUs
  "SND_SOC_FSL_ASRC" = no; # Asynchronous Sample Rate Converter (ASRC) module support
  "SND_SOC_FSL_SAI" = no; # Synchronous Audio Interface (SAI) module support
  "SND_SOC_FSL_AUDMIX" = no; # Audio Mixer (AUDMIX) module support
  "SND_SOC_FSL_SSI" = no; # Synchronous Serial Interface module (SSI) support
  "SND_SOC_FSL_SPDIF" = no; # Sony/Philips Digital Interface (S/PDIF) module support
  "SND_SOC_FSL_ESAI" = no; # Enhanced Serial Audio Interface (ESAI) module support
  "SND_SOC_FSL_MICFIL" = no; # Pulse Density Modulation Microphone Interface (MICFIL) module support
  "SND_SOC_IMX_AUDMUX" = no; # Digital Audio Mux module support
  ###### end of SoC Audio for Freescale CPUs

  "SND_I2S_HI6210_I2S" = no; # Hisilicon I2S controller
  "SND_SOC_IMG" = no; # Audio support for Imagination Technologies designs
  "SND_SOC_MTK_BTCVSD" = no; # ALSA BT SCO CVSD/MSBC Driver
  "SND_SOC_SOF_TOPLEVEL" = no; # Sound Open Firmware Support
  "SND_SOC_XILINX_I2S" = no; # Audio support for the Xilinx I2S
  "SND_SOC_XILINX_AUDIO_FORMATTER" = no; # Audio support for the Xilinx audio formatter
  "SND_SOC_XILINX_SPDIF" = no; # Audio support for the Xilinx SPDIF
  "SND_SOC_XTFPGA_I2S" = no; # XTFPGA I2S master
  "ZX_TDM" = no; # ZTE ZX TDM Driver Support

  ###### CODEC drivers
  "SND_SOC_AC97_CODEC" = no; # Build generic ASoC AC97 CODEC driver
  "SND_SOC_ADAU1701" = no; # Analog Devices ADAU1701 CODEC
  "SND_SOC_ADAU1761_I2C" = no; # Analog Devices AU1761 CODEC - I2C
  "SND_SOC_ADAU1761_SPI" = no; # Analog Devices AU1761 CODEC - SPI
  "SND_SOC_ADAU7002" = no; # Analog Devices ADAU7002 Stereo PDM-to-I2S/TDM Converter
  "SND_SOC_ADAU7118_HW" = no; # Analog Devices ADAU7118 8 Channel PDM-to-I2S/TDM Converter - HW Mode
  "SND_SOC_ADAU7118_I2C" = no; # Analog Devices ADAU7118 8 Channel PDM-to-I2S/TDM Converter - I2C
  "SND_SOC_AK4104" = no; # AKM AK4104 CODEC
  "SND_SOC_AK4118" = no; # AKM AK4118 CODEC
  "SND_SOC_AK4458" = no; # AKM AK4458 CODEC
  "SND_SOC_AK4554" = no; # AKM AK4554 CODEC
  "SND_SOC_AK4613" = no; # AKM AK4613 CODEC
  "SND_SOC_AK4642" = no; # AKM AK4642 CODEC
  "SND_SOC_AK5386" = no; # AKM AK5638 CODEC
  "SND_SOC_AK5558" = no; # AKM AK5558 CODEC
  "SND_SOC_ALC5623" = no; # Realtek ALC5623 CODEC
  "SND_SOC_BD28623" = no; # ROHM BD28623 CODEC
  "SND_SOC_BT_SCO" = no; # Dummy BT SCO codec driver
  "SND_SOC_CS35L32" = no; # Cirrus Logic CS35L32 CODEC
  "SND_SOC_CS35L33" = no; # Cirrus Logic CS35L33 CODEC
  "SND_SOC_CS35L34" = no; # Cirrus Logic CS35L34 CODEC
  "SND_SOC_CS35L35" = no; # Cirrus Logic CS35L35 CODEC
  "SND_SOC_CS35L36" = no; # Cirrus Logic CS35L36 CODEC
  "SND_SOC_CS42L42" = no; # Cirrus Logic CS42L42 CODEC
  "SND_SOC_CS42L51_I2C" = no; # Cirrus Logic CS42L51 CODEC (I2C)
  "SND_SOC_CS42L52" = no; # Cirrus Logic CS42L52 CODEC
  "SND_SOC_CS42L56" = no; # Cirrus Logic CS42L56 CODEC
  "SND_SOC_CS42L73" = no; # Cirrus Logic CS42L73 CODEC
  "SND_SOC_CS4234" = no; # Cirrus Logic CS4234 CODEC
  "SND_SOC_CS4265" = no; # Cirrus Logic CS4265 CODEC
  "SND_SOC_CS4270" = no; # Cirrus Logic CS4270 CODEC
  "SND_SOC_CS4271_I2C" = no; # Cirrus Logic CS4271 CODEC (I2C)
  "SND_SOC_CS4271_SPI" = no; # Cirrus Logic CS4271 CODEC (SPI)
  "SND_SOC_CS42XX8_I2C" = no; # Cirrus Logic CS42448/CS42888 CODEC (I2C)
  "SND_SOC_CS43130" = no; # Cirrus Logic CS43130 CODEC
  "SND_SOC_CS4341" = no; # Cirrus Logic CS4341 CODEC
  "SND_SOC_CS4349" = no; # Cirrus Logic CS4349 CODEC
  "SND_SOC_CS53L30" = no; # Cirrus Logic CS53L30 CODEC
  "SND_SOC_CX2072X" = no; # Conexant CX2072X CODEC
  "SND_SOC_DA7213" = no; # Dialog DA7213 CODEC
  "SND_SOC_DMIC" = no; # Generic Digital Microphone CODEC
  "SND_SOC_ES7134" = no; # Everest Semi ES7134 CODEC
  "SND_SOC_ES7241" = no; # Everest Semi ES7241 CODEC
  "SND_SOC_ES8316" = no; # Everest Semi ES8316 CODEC
  "SND_SOC_ES8328_I2C" = no; # Everest Semi ES8328 CODEC (I2C)
  "SND_SOC_ES8328_SPI" = no; # Everest Semi ES8328 CODEC (SPI)
  "SND_SOC_GTM601" = no; # GTM601 UMTS modem audio codec
  "SND_SOC_INNO_RK3036" = no; # Inno codec driver for RK3036 SoC
  "SND_SOC_MAX98088" = no; # Maxim MAX98088/9 Low-Power, Stereo Audio Codec
  "SND_SOC_MAX98357A" = no; # Maxim MAX98357A CODEC
  "SND_SOC_MAX98504" = no; # Maxim MAX98504 speaker amplifier
  "SND_SOC_MAX9867" = no; # Maxim MAX9867 CODEC
  "SND_SOC_MAX98927" = no; # Maxim Integrated MAX98927 Speaker Amplifier
  "SND_SOC_MAX98373_I2C" = no; # Maxim Integrated MAX98373 Speaker Amplifier
  "SND_SOC_MAX98390" = no; # Maxim Integrated MAX98390 Speaker Amplifier
  "SND_SOC_MAX9860" = no; # Maxim MAX9860 Mono Audio Voice Codec
  "SND_SOC_MSM8916_WCD_DIGITAL" = no; # Qualcomm MSM8916 WCD DIGITAL Codec
  "SND_SOC_PCM1681" = no; # Texas Instruments PCM1681 CODEC
  "SND_SOC_PCM1789_I2C" = no; # Texas Instruments PCM1789 CODEC (I2C)
  "SND_SOC_PCM179X_I2C" = no; # Texas Instruments PCM179X CODEC (I2C)
  "SND_SOC_PCM179X_SPI" = no; # Texas Instruments PCM179X CODEC (SPI)
  "SND_SOC_PCM186X_I2C" = no; # Texas Instruments PCM186x CODECs - I2C
  "SND_SOC_PCM186X_SPI" = no; # Texas Instruments PCM186x CODECs - SPI
  "SND_SOC_PCM3060_I2C" = no; # Texas Instruments PCM3060 CODEC - I2C
  "SND_SOC_PCM3060_SPI" = no; # Texas Instruments PCM3060 CODEC - SPI
  "SND_SOC_PCM3168A_I2C" = no; # Texas Instruments PCM3168A CODEC - I2C
  "SND_SOC_PCM3168A_SPI" = no; # Texas Instruments PCM3168A CODEC - SPI
  "SND_SOC_PCM512x_I2C" = no; # Texas Instruments PCM512x CODECs - I2C
  "SND_SOC_PCM512x_SPI" = no; # Texas Instruments PCM512x CODECs - SPI
  "SND_SOC_RK3328" = no; # Rockchip RK3328 audio CODEC
  "SND_SOC_RT5616" = no; # Realtek RT5616 CODEC
  "SND_SOC_RT5631" = no; # Realtek ALC5631/RT5631 CODEC
  "SND_SOC_SGTL5000" = no; # Freescale SGTL5000 CODEC
  "SND_SOC_SIMPLE_AMPLIFIER" = no; # Simple Audio Amplifier
  "SND_SOC_SIRF_AUDIO_CODEC" = no; # SiRF SoC internal audio codec
  "SND_SOC_SPDIF" = no; # S/PDIF CODEC
  "SND_SOC_SSM2305" = no; # Analog Devices SSM2305 Class-D Amplifier
  "SND_SOC_SSM2602_SPI" = no; # Analog Devices SSM2602 CODEC - SPI
  "SND_SOC_SSM2602_I2C" = no; # Analog Devices SSM2602 CODEC - I2C
  "SND_SOC_SSM4567" = no; # Analog Devices ssm4567 amplifier driver support
  "SND_SOC_STA32X" = no; # STA326, STA328 and STA329 speaker amplifier
  "SND_SOC_STA350" = no; # STA350 speaker amplifier
  "SND_SOC_STI_SAS" = no; # codec Audio support for STI SAS codec
  "SND_SOC_TAS2552" = no; # Texas Instruments TAS2552 Mono Audio amplifier
  "SND_SOC_TAS2562" = no; # Texas Instruments TAS2562 Mono Audio amplifier
  "SND_SOC_TAS2764" = no; # Texas Instruments TAS2764 Mono Audio amplifier
  "SND_SOC_TAS2770" = no; # Texas Instruments TAS2770 speaker amplifier
  "SND_SOC_TAS5086" = no; # Texas Instruments TAS5086 speaker amplifier
  "SND_SOC_TAS571X" = no; # Texas Instruments TAS571x power amplifiers
  "SND_SOC_TAS5720" = no; # Texas Instruments TAS5720 Mono Audio amplifier
  "SND_SOC_TAS6424" = no; # Texas Instruments TAS6424 Quad-Channel Audio amplifier
  "SND_SOC_TDA7419" = no; # ST TDA7419 audio processor
  "SND_SOC_TFA9879" = no; # NXP Semiconductors TFA9879 amplifier
  "SND_SOC_TLV320AIC23_I2C" = no; # Texas Instruments TLV320AIC23 audio CODEC - I2C
  "SND_SOC_TLV320AIC23_SPI" = no; # Texas Instruments TLV320AIC23 audio CODEC - SPI
  "SND_SOC_TLV320AIC31XX" = no; # Texas Instruments TLV320AIC31xx CODECs
  "SND_SOC_TLV320AIC32X4_I2C" = no; # Texas Instruments TLV320AIC32x4 audio CODECs - I2C
  "SND_SOC_TLV320AIC32X4_SPI" = no; # Texas Instruments TLV320AIC32x4 audio CODECs - SPI
  "SND_SOC_TLV320AIC3X" = no; # Texas Instruments TLV320AIC3x CODECs
  "SND_SOC_TLV320ADCX140" = no; # Texas Instruments TLV320ADCX140 CODEC family
  "SND_SOC_TS3A227E" = no; # TI Headset/Mic detect and keypress chip
  "SND_SOC_TSCS42XX" = no; # Tempo Semiconductor TSCS42xx CODEC
  "SND_SOC_TSCS454" = no; # Tempo Semiconductor TSCS454 CODEC
  "SND_SOC_UDA1334" = no; # NXP UDA1334 DAC
  "SND_SOC_WM8510" = no; # Wolfson Microelectronics WM8510 CODEC
  "SND_SOC_WM8523" = no; # Wolfson Microelectronics WM8523 DAC
  "SND_SOC_WM8524" = no; # Wolfson Microelectronics WM8524 DAC
  "SND_SOC_WM8580" = no; # Wolfson Microelectronics WM8580 and WM8581 CODECs
  "SND_SOC_WM8711" = no; # Wolfson Microelectronics WM8711 CODEC
  "SND_SOC_WM8728" = no; # Wolfson Microelectronics WM8728 DAC
  "SND_SOC_WM8731" = no; # Wolfson Microelectronics WM8731 CODEC
  "SND_SOC_WM8737" = no; # Wolfson Microelectronics WM8737 ADC
  "SND_SOC_WM8741" = no; # Wolfson Microelectronics WM8741 DAC
  "SND_SOC_WM8750" = no; # Wolfson Microelectronics WM8750 CODEC
  "SND_SOC_WM8753" = no; # Wolfson Microelectronics WM8753 CODEC
  "SND_SOC_WM8770" = no; # Wolfson Microelectronics WM8770 CODEC
  "SND_SOC_WM8776" = no; # Wolfson Microelectronics WM8776 CODEC
  "SND_SOC_WM8782" = no; # Wolfson Microelectronics WM8782 ADC
  "SND_SOC_WM8804_I2C" = no; # Wolfson Microelectronics WM8804 S/PDIF transceiver I2C
  "SND_SOC_WM8804_SPI" = no; # Wolfson Microelectronics WM8804 S/PDIF transceiver SPI
  "SND_SOC_WM8903" = no; # Wolfson Microelectronics WM8903 CODEC
  "SND_SOC_WM8904" = no; # Wolfson Microelectronics WM8904 CODEC
  "SND_SOC_WM8960" = no; # Wolfson Microelectronics WM8960 CODEC
  "SND_SOC_WM8962" = no; # Wolfson Microelectronics WM8962 CODEC
  "SND_SOC_WM8974" = no; # Wolfson Microelectronics WM8974 codec
  "SND_SOC_WM8978" = no; # Wolfson Microelectronics WM8978 codec
  "SND_SOC_WM8985" = no; # Wolfson Microelectronics WM8985 and WM8758 codec driver
  "SND_SOC_ZL38060" = no; # Microsemi ZL38060 Connected Home Audio Processor
  "SND_SOC_ZX_AUD96P22" = no; # ZTE ZX AUD96P22 CODEC
  "SND_SOC_MAX9759" = no; # Maxim MAX9759 speaker Amplifier
  "SND_SOC_MT6351" = no; # MediaTek MT6351 Codec
  "SND_SOC_MT6358" = no; # MediaTek MT6358 Codec
  "SND_SOC_MT6660" = no; # Mediatek MT6660 Speaker Amplifier
  "SND_SOC_NAU8540" = no; # Nuvoton Technology Corporation NAU85L40 CODEC
  "SND_SOC_NAU8810" = no; # Nuvoton Technology Corporation NAU88C10 CODEC
  "SND_SOC_NAU8822" = no; # Nuvoton Technology Corporation NAU88C22 CODEC
  "SND_SOC_NAU8824" = no; # Nuvoton Technology Corporation NAU88L24 CODEC
  "SND_SOC_TPA6130A2" = no; # Texas Instruments TPA6130A2 headphone amplifier
  ###### end of CODEC drivers

  "SND_SIMPLE_CARD" = no; # ASoC Simple sound card support
  "SND_AUDIO_GRAPH_CARD" = no; # ASoC Audio Graph sound card support

  ### Device Drivers -> HID support
  "HID" = yes; # HID bus support
  "HID_BATTERY_STRENGTH" = no; # Battery level reporting for HID devices
  "HIDRAW" = no; # /dev/hidraw raw HID device support
  "UHID" = no; # User-space I/O driver support for HID subsystem
  "HID_GENERIC" = yes; # Generic HID driver

  ##### Special HID drivers
  "HID_A4TECH" = no; # A4 tech mice
  "HID_ACCUTOUCH" = no; # Accutouch touch device
  "HID_ACRUX" = no; # ACRUX game controller support
  "HID_APPLE" = no; # Apple {i,Power,Mac}Books
  "HID_APPLEIR" = no; # Apple infrared receiver
  "HID_AUREAL" = no; # Aureal
  "HID_BELKIN" = no; # Belkin Flip KVM and Wireless keyboard
  "HID_BETOP_FF" = no; # Betop Production Inc. force feedback support
  "HID_CHERRY" = no; # Cherry Cymotion keyboard
  "HID_CHICONY" = no; # Chicony devices
  "HID_COUGAR" = no; # Cougar devices
  "HID_MACALLY" = no; # Macally devices
  "HID_PRODIKEYS" = no; # Prodikeys PC-MIDI Keyboard support
  "HID_CMEDIA" = no; # CMedia CM6533 HID audio jack controls
  "HID_CREATIVE_SB0540" = no; # Creative SB0540 infrared receiver
  "HID_CYPRESS" = no; # Cypress mouse and barcode readers
  "HID_DRAGONRISE" = no; # DragonRise Inc. game controller
  "HID_EMS_FF" = no; # EMS Production Inc. force feedback support
  "HID_ELECOM" = no; # ELECOM HID devices
  "HID_ELO" = no; # ELO USB 4000/4500 touchscreen
  "HID_EZKEY" = no; # Ezkey BTC 8193 keyboard
  "HID_GEMBIRD" = no; # Gembird Joypad
  "HID_GFRM" = no; # Google Fiber TV Box remote control support
  "HID_GLORIOUS" = no; # Glorious PC Gaming Race mice
  "HID_HOLTEK" = no; # Holtek HID devices
  "HID_VIVALDI" = no; # Vivaldi Keyboard
  "HID_KEYTOUCH" = no; # Keytouch HID devices
  "HID_KYE" = no; # KYE/Genius devices
  "HID_UCLOGIC" = no; # UC-Logic
  "HID_WALTOP" = no; # Waltop
  "HID_VIEWSONIC" = no; # ViewSonic/Signotec
  "HID_GYRATION" = no; # Gyration remote control
  "HID_ICADE" = no; # ION iCade arcade controller
  "HID_ITE" = no; # ITE devices
  "HID_JABRA" = no; # Jabra USB HID Driver
  "HID_TWINHAN" = no; # Twinhan IR remote control
  "HID_KENSINGTON" = no; # Kensington Slimblade Trackball
  "HID_LCPOWER" = no; # LC-Power
  "HID_LENOVO" = no; # Lenovo / Thinkpad devices
  "HID_MAGICMOUSE" = no; # Apple Magic Mouse/Trackpad multi-touch support
  "HID_MALTRON" = no; # Maltron L90 keyboard
  "HID_MAYFLASH" = no; # Mayflash game controller adapter force feedback
  "HID_REDRAGON" = no; # Redragon keyboards
  "HID_MICROSOFT" = no; # Microsoft non-fully HID-compliant devices
  "HID_MONTEREY" = no; # Monterey Genius KB29E keyboard
  "HID_MULTITOUCH" = no; # HID Multitouch panels
  "HID_NTI" = no; # NTI keyboard adapters
  "HID_NTRIG" = no; # N-Trig touch screen
  "HID_ORTEK" = no; # Ortek PKB-1700/WKB-2000/Skycable wireless keyboard and mouse trackpad
  "HID_PANTHERLORD" = no; # Pantherlord/GreenAsia game controller
  "HID_PENMOUNT" = no; # Penmount touch device
  "HID_PETALYNX" = no; # Petalynx Maxter remote control
  "HID_PICOLCD" = no; # PicoLCD (graphic version)
  "HID_PLANTRONICS" = no; # Plantronics USB HID Driver
  "HID_PRIMAX" = no; # Primax non-fully HID-compliant devices
  "HID_RETRODE" = no; # Retrode 2 USB adapter for vintage video games
  "HID_ROCCAT" = no; # Roccat device support
  "HID_SAITEK" = no; # Saitek (Mad Catz) non-fully HID-compliant devices
  "HID_SAMSUNG" = no; # Samsung InfraRed remote control or keyboards
  "HID_SPEEDLINK" = no; # Speedlink VAD Cezanne mouse support
  "HID_STEAM" = no; # Steam Controller support
  "HID_STEELSERIES" = no; # Steelseries SRW-S1 steering wheel support
  "HID_SUNPLUS" = no; # Sunplus wireless desktop
  "HID_RMI" = no; # Synaptics RMI4 device support
  "HID_GREENASIA" = no; # GreenAsia (Product ID 0x12) game controller support
  "HID_SMARTJOYPLUS" = no; # SmartJoy PLUS PS2/USB adapter support
  "HID_TIVO" = no; # TiVo Slide Bluetooth remote control support
  "HID_TOPSEED" = no; # TopSeed Cyberlink, BTC Emprex, Conceptronic remote control support
  "HID_THRUSTMASTER" = no; # ThrustMaster devices support
  "HID_UDRAW_PS3" = no; # THQ PS3 uDraw tablet
  "HID_WACOM" = no; # Wacom Intuos/Graphire tablet support (USB)
  "HID_XINMO" = no; # Xin-Mo non-fully compliant devices
  "HID_ZEROPLUS" = no; # Zeroplus based game controller support
  "HID_ZYDACRON" = no; # Zydacron remote control support
  "HID_SENSOR_HUB" = no; # HID Sensors framework support
  "HID_ALPS" = no; # Alps HID device support
  "HID_MCP2221" = no; # Microchip MCP2221 HID USB-to-I2C/SMbus host support
  ##### end of Special HID drivers

  #### Device Drivers -> HID support -> USB HID support
  "USB_HID" = yes; # USB HID transport layer
  "HID_PID" = no; # PID device support
  "USB_HIDDEV" = no; # /dev/hiddev raw HID device support
  #### Device Drivers -> HID support: end of USB HID support

  #### Device Drivers -> HID support -> I2C HID support
  "I2C_HID" = no; # HID over I2C transport layer
  #### Device Drivers -> HID support: end of I2C HID support
  ### Device Drivers: end of HID support

  "USB_SUPPORT" = yes; # USB support
  "USB_ULPI_BUS" = no; # USB ULPI PHY interface support
  "USB_CONN_GPIO" = no; # USB GPIO Based Connection Detection Driver
  "USB" = yes; # Support for Host-side USB
  "USB_ANNOUNCE_NEW_DEVICES" = no; # USB announce new devices
  "USB_DEFAULT_PERSIST" = yes; # Enable USB persist by default
  "USB_FEW_INIT_RETRIES" = no; # Limit USB device initialization to only a few retries
  "USB_DYNAMIC_MINORS" = no; # Dynamic USB minor allocation
  "USB_OTG_PRODUCTLIST" = no; # Rely on OTG and EH Targeted Peripherals List
  "USB_OTG_DISABLE_EXTERNAL_HUB" = no; # Disable external hubs
  "USB_AUTOSUSPEND_DELAY" = freeform "2"; # Default autosuspend delay
  "USB_MON" = no; # USB Monitor
  "USB_C67X00_HCD" = no; # Cypress C67x00 HCD support
  "USB_XHCI_HCD" = no; # xHCI HCD (USB 3.0) support
  "USB_EHCI_HCD" = no; # EHCI HCD (USB 2.0) support
  "USB_OXU210HP_HCD" = no; # OXU210HP HCD support
  "USB_ISP116X_HCD" = no; # ISP116X HCD support
  "USB_FOTG210_HCD" = no; # FOTG210 HCD support
  "USB_MAX3421_HCD" = no; # MAX3421 HCD (USB-over-SPI) support
  "USB_OHCI_HCD" = no; # OHCI HCD (USB 1.1) support
  "USB_SL811_HCD" = no; # SL811HS HCD support
  "USB_R8A66597_HCD" = no; # R8A66597 HCD support
  "USB_HCD_TEST_MODE" = no; # HCD test mode support
  "USB_ACM" = no; # USB Modem (CDC ACM) support
  "USB_PRINTER" = no; # USB Printer support
  "USB_WDM" = no; # USB Wireless Device Management support
  "USB_TMC" = no; # USB Test and Measurement Class support
  "USB_STORAGE" = yes; # USB Mass Storage support
  "USB_STORAGE_DEBUG" = no; # USB Mass Storage verbose debug
  "USB_STORAGE_REALTEK" = no; # Realtek Card Reader support
  "USB_STORAGE_DATAFAB" = no; # Datafab Compact Flash Reader support
  "USB_STORAGE_FREECOM" = no; # Freecom USB/ATAPI Bridge support
  "USB_STORAGE_ISD200" = no; # ISD-200 USB/ATA Bridge support
  "USB_STORAGE_USBAT" = no; # USBAT/USBAT02-based storage support
  "USB_STORAGE_SDDR09" = no; # SanDisk SDDR-09 (and other SmartMedia, including DPCM) support
  "USB_STORAGE_SDDR55" = no; # SanDisk SDDR-55 SmartMedia support
  "USB_STORAGE_JUMPSHOT" = no; # Lexar Jumpshot Compact Flash Reader
  "USB_STORAGE_ALAUDA" = no; # Olympus MAUSB-10/Fuji DPC-R1 support
  "USB_STORAGE_ONETOUCH" = no; # Support OneTouch Button on Maxtor Hard Drives
  "USB_STORAGE_KARMA" = no; # Support for Rio Karma music player
  "USB_STORAGE_CYPRESS_ATACB" = no; # SAT emulation on Cypress USB/ATA Bridge with ATACB
  "USB_STORAGE_ENE_UB6250" = no; # USB ENE card reader support
  "USB_UAS" = no; # USB Attached SCSI
  "USB_MDC800" = no; # USB Mustek MDC800 Digital Camera support
  "USB_MICROTEK" = no; # Microtek X6USB scanner support
  "USBIP_CORE" = no; # USB/IP support
  "USB_CDNS3" = no; # Cadence USB3 Dual-Role Controller
  "USB_MUSB_HDRC" = no; # Inventra Highspeed Dual Role Controller
  "USB_DWC3" = no; # DesignWare USB3 DRD Core Support
  "USB_DWC2" = yes; # DesignWare USB2 DRD Core Support
  "USB_DWC2_HOST" = no; # Host only mode
  "USB_DWC2_PERIPHERAL" = no; # Gadget only mode
  "USB_DWC2_DUAL_ROLE" = yes; # Dual Role mode
  "USB_DWC2_DEBUG" = no; # Enable Debugging Messages
  "USB_DWC2_TRACK_MISSED_SOFS" = no; # Enable Missed SOF Tracking
  "USB_CHIPIDEA" = no; # ChipIdea Highspeed Dual Role Controller
  "USB_ISP1760" = no; # NXP ISP 1760/1761 support
  "USB_CVITEK_DRD" = no; # Cvitek USB DRD Core Support
  "USB_CVITEK_GADGET" = module; # Cvitek device controller
  "USB_SERIAL" = no; # USB Serial Converter support
  "USB_EMI62" = no; # EMI 6|2m USB Audio interface support
  "USB_EMI26" = no; # EMI 2|6 USB Audio interface support
  "USB_ADUTUX" = no; # ADU devices from Ontrak Control Systems
  "USB_SEVSEG" = no; # USB 7-Segment LED Display
  "USB_LEGOTOWER" = no; # USB Lego Infrared Tower support
  "USB_LCD" = no; # USB LCD driver support
  "USB_CYPRESS_CY7C63" = no; # Cypress CY7C63xxx USB driver support
  "USB_CYTHERM" = no; # Cypress USB thermometer driver support
  "USB_IDMOUSE" = no; # Siemens ID USB Mouse Fingerprint sensor support
  "USB_FTDI_ELAN" = no; # Elan PCMCIA CardBus Adapter USB Client
  "USB_APPLEDISPLAY" = no; # Apple Cinema Display support
  "APPLE_MFI_FASTCHARGE" = no; # Fast charge control for iOS devices
  "USB_LD" = no; # USB LD driver
  "USB_TRANCEVIBRATOR" = no; # PlayStation 2 Trance Vibrator driver support
  "USB_IOWARRIOR" = no; # IO Warrior driver support
  "USB_TEST" = no; # USB testing driver
  "USB_EHSET_TEST_FIXTURE" = no; # USB EHSET Test Fixture driver
  "USB_ISIGHTFW" = no; # iSight firmware loading support
  "USB_YUREX" = no; # USB YUREX driver support
  "USB_EZUSB_FX2" = no; # Functions for loading firmware on EZUSB chips
  "USB_HUB_USB251XB" = no; # USB251XB Hub Controller Configuration Driver
  "USB_HSIC_USB3503" = no; # USB3503 HSIC to USB20 Driver
  "USB_HSIC_USB4604" = no; # USB4604 HSIC to USB20 Driver
  "USB_LINK_LAYER_TEST" = no; # USB Link Layer Test driver
  "USB_CHAOSKEY" = no; # ChaosKey random number generator driver support

  #### USB Physical Layer drivers
  "NOP_USB_XCEIV" = no; # NOP USB Transceiver Driver
  "USB_GPIO_VBUS" = no; # GPIO based peripheral-only VBUS sensing 'transceiver'
  "USB_ISP1301" = no; # NXP ISP1301 USB transceiver support
  #### end of USB Physical Layer drivers

  "USB_GADGET" = yes; # USB Gadget Support
  "USB_GADGET_DEBUG" = no; # Debugging messages (DEVELOPMENT)
  "USB_GADGET_DEBUG_FILES" = no; # Debugging information files (DEVELOPMENT)
  "USB_GADGET_DEBUG_FS" = no; # Debugging information files in debugfs (DEVELOPMENT)
  "USB_GADGET_VBUS_DRAW" = freeform "2"; # Maximum VBUS Power usage (2-500 mA)
  "USB_GADGET_STORAGE_NUM_BUFFERS" = freeform "2"; # Number of storage pipeline buffers
  "U_SERIAL_CONSOLE" = no; # Serial gadget console support

  ##### USB Peripheral Controller
  "USB_FOTG210_UDC" = no; # Faraday FOTG210 USB Peripheral Controller
  "USB_GR_UDC" = no; # Aeroflex Gaisler GRUSBDC USB Peripheral Controller Driver
  "USB_R8A66597" = no; # Renesas R8A66597 USB Peripheral Controller
  "USB_PXA27X" = no; # PXA 27x
  "USB_MV_UDC" = no; # Marvell USB2.0 Device Controller
  "USB_MV_U3D" = no; # MARVELL PXA2128 USB 3.0 controller
  "USB_SNP_UDC_PLAT" = no; # Synopsys USB 2.0 Device controller
  "USB_M66592" = no; # Renesas M66592 USB Peripheral Controller
  "USB_BDC_UDC" = no; # Broadcom USB3.0 device controller IP driver(BDC)
  "USB_NET2272" = no; # PLX NET2272
  "USB_GADGET_XILINX" = no; # Xilinx USB Driver
  "USB_MAX3420_UDC" = no; # MAX3420 (USB-over-SPI) support
  "USB_DUMMY_HCD" = module; # Dummy HCD (DEVELOPMENT)
  ##### end of USB Peripheral Controller

  "USB_CONFIGFS" = yes; # USB Gadget functions configurable through configfs
  "USB_CONFIGFS_SERIAL" = yes; # Generic serial bulk in/out
  "USB_CONFIGFS_ACM" = yes; # Abstract Control Model (CDC ACM)
  "USB_CONFIGFS_OBEX" = no; # Object Exchange Model (CDC OBEX)
  "USB_CONFIGFS_NCM" = no; # Network Control Model (CDC NCM)
  "USB_CONFIGFS_ECM" = no; # Ethernet Control Model (CDC ECM)
  "USB_CONFIGFS_ECM_SUBSET" = no; # Ethernet Control Model (CDC ECM) subset
  "USB_CONFIGFS_RNDIS" = yes; # RNDIS
  "USB_CONFIGFS_EEM" = no; # Ethernet Emulation Model (EEM)
  "USB_CONFIGFS_MASS_STORAGE" = yes; # Mass storage
  "USB_CONFIGFS_F_LB_SS" = no; # Loopback and sourcesink function (for testing)
  "USB_CONFIGFS_F_FS" = no; # Function filesystem (FunctionFS)
  "USB_CONFIGFS_F_UAC1" = no; # Audio Class 1.0
  "USB_CONFIGFS_F_UAC1_LEGACY" = no; # Audio Class 1.0 (legacy implementation)
  "USB_CONFIGFS_F_UAC2" = no; # Audio Class 2.0
  "USB_CONFIGFS_F_MIDI" = no; # MIDI function
  "USB_CONFIGFS_F_HID" = no; # HID function
  "USB_CONFIGFS_F_PRINTER" = no; # Printer function

  ##### USB Gadget precomposed configurations
  "USB_ZERO" = no; # Gadget Zero (DEVELOPMENT)
  "USB_AUDIO" = no; # Audio Gadget
  "USB_ETH" = yes; # Ethernet Gadget (with CDC Ethernet support)
  "USB_ETH_RNDIS" = yes; # RNDIS support
  "USB_G_NCM" = no; # Network Control Model (NCM) support
  "USB_GADGETFS" = no; # Gadget Filesystem
  "USB_FUNCTIONFS" = no; # Function Filesystem
  "USB_MASS_STORAGE" = no; # Mass Storage Gadget
  "USB_G_SERIAL" = no; # Serial Gadget (with CDC ACM and CDC OBEX support)
  "USB_MIDI_GADGET" = no; # MIDI Gadget
  "USB_G_PRINTER" = no; # Printer Gadget
  "USB_CDC_COMPOSITE" = no; # CDC Composite Device (Ethernet and ACM)
  "USB_G_ACM_MS" = no; # CDC Composite Device (ACM and mass storage)
  "USB_G_MULTI" = no; # Multifunction Composite Gadget
  "USB_G_HID" = no; # HID Gadget
  "USB_G_DBGP" = no; # EHCI Debug Device Gadget
  "USB_RAW_GADGET" = no; # USB Raw Gadget
  ##### end of USB Gadget precomposed configurations

  "TYPEC" = no; # USB Type-C Support
  "USB_ROLE_SWITCH" = yes; # USB Role Switch Support
  "MMC" = yes; # MMC/SD/SDIO card support
  "PWRSEQ_EMMC" = yes; # HW reset support for eMMC
  "PWRSEQ_SIMPLE" = yes; # Simple HW reset support for MMC
  "MMC_BLOCK" = yes; # MMC block device driver
  "MMC_BLOCK_MINORS" = freeform "8"; # Number of minors per block device
  "SDIO_UART" = no; # SDIO UART/GPS class support
  "MMC_TEST" = no; # MMC host test driver
  "MMC_DEBUG" = no; # MMC host drivers debugging
  "MMC_SDHCI" = yes; # Secure Digital Host Controller Interface support
  "MMC_SDHCI_PLTFM" = yes; # SDHCI platform and OF driver helper
  "MMC_SDHCI_OF_ARASAN" = no; # SDHCI OF support for the Arasan SDHCI controllers
  "MMC_SDHCI_OF_ASPEED" = no; # SDHCI OF support for the ASPEED SDHCI controller
  "MMC_SDHCI_OF_AT91" = no; # SDHCI OF support for the Atmel SDMMC controller
  "MMC_SDHCI_OF_DWCMSHC" = no; # SDHCI OF support for the Synopsys DWC MSHC
  "MMC_SDHCI_OF_LIGHT_MPW" = no; # SDHCI OF support for the Synopsys DWC MSHC of Light MPW
  "MMC_SDHCI_CADENCE" = no; # SDHCI support for the Cadence SD/SDIO/eMMC controller
  "MMC_SDHCI_F_SDH30" = no; # SDHCI support for Fujitsu Semiconductor F_SDH30
  "MMC_SDHCI_MILBEAUT" = no; # SDHCI support for Socionext Milbeaut Serieas using F_SDH30
  "MMC_SDHCI_CVI" = yes; # CVITEK SDHCI Controller Support
  "MMC_SPI" = no; # MMC/SD/SDIO over SPI
  "MMC_DW" = no; # Synopsys DesignWare Memory Card Interface
  "MMC_VUB300" = no; # VUB300 USB to SDIO/SD/MMC Host Controller support
  "MMC_USHC" = no; # USB SD Host Controller (USHC) support
  "MMC_USDHI6ROL0" = no; # Renesas USDHI6ROL0 SD/SDIO Host Controller support
  "MMC_CQHCI" = no; # Command Queue Host Controller Interface support
  "MMC_HSQ" = no; # MMC Host Software Queue support
  "MMC_MTK" = no; # MediaTek SD/MMC Card Interface support
  "MMC_SDHCI_XENON" = no; # Marvell Xenon eMMC/SD/SDIO SDHCI driver
  "MMC_SDHCI_OMAP" = no; # TI SDHCI Controller Support
  "MMC_SDHCI_AM654" = no; # Support for the SDHCI Controller in TI's AM654 SOCs
  "MEMSTICK" = no; # Sony MemoryStick card support
  "NEW_LEDS" = no; # LED Support
  "ACCESSIBILITY" = no; # Accessibility support
  "INFINIBAND" = no; # InfiniBand support
  "RTC_CLASS" = yes; # Real Time Clock
  "RTC_HCTOSYS" = yes; # Set system time from RTC on startup and resume
  "RTC_HCTOSYS_DEVICE" = freeform "rtc0"; # RTC used to set the system time
  "RTC_SYSTOHC" = yes; # Set the RTC time based on NTP synchronization
  "RTC_SYSTOHC_DEVICE" = freeform "rtc0"; # RTC used to synchronize NTP adjustment
  "RTC_DEBUG" = no; # RTC debug support
  "RTC_NVMEM" = yes; # RTC non volatile storage support
  "RTC_INTF_SYSFS" = yes; # /sys/class/rtc/rtcN (sysfs)
  "RTC_INTF_PROC" = yes; # /proc/driver/rtc (procfs for rtcN)
  "RTC_INTF_DEV" = yes; # /dev/rtcN (character devices)
  "RTC_INTF_DEV_UIE_EMUL" = no; # RTC UIE emulation on dev interface
  "RTC_DRV_TEST" = no; # Test driver/device
  "RTC_DRV_ABB5ZES3" = no; # Abracon AB-RTCMC-32.768kHz-B5ZE-S3
  "RTC_DRV_ABEOZ9" = no; # Abracon AB-RTCMC-32.768kHz-EOZ9
  "RTC_DRV_ABX80X" = no; # Abracon ABx80x
  "RTC_DRV_DS1307" = no; # Dallas/Maxim DS1307/37/38/39/40/41, ST M41T00, EPSON RX-8025, ISL12057
  "RTC_DRV_DS1374" = no; # Dallas/Maxim DS1374
  "RTC_DRV_DS1672" = no; # Dallas/Maxim DS1672
  "RTC_DRV_HYM8563" = no; # Haoyu Microelectronics HYM8563
  "RTC_DRV_MAX6900" = no; # Maxim MAX6900
  "RTC_DRV_RS5C372" = no; # Ricoh R2025S/D, RS5C372A/B, RV5C386, RV5C387A
  "RTC_DRV_ISL1208" = no; # Intersil ISL1208
  "RTC_DRV_ISL12022" = no; # Intersil ISL12022
  "RTC_DRV_ISL12026" = no; # Intersil ISL12026
  "RTC_DRV_X1205" = no; # Xicor/Intersil X1205
  "RTC_DRV_PCF8523" = no; # NXP PCF8523
  "RTC_DRV_PCF85063" = no; # NXP PCF85063
  "RTC_DRV_PCF85363" = no; # NXP PCF85363
  "RTC_DRV_PCF8563" = no; # Philips PCF8563/Epson RTC8564
  "RTC_DRV_PCF8583" = no; # Philips PCF8583
  "RTC_DRV_M41T80" = no; # ST M41T62/65/M41T80/81/82/83/84/85/87 and compatible
  "RTC_DRV_BQ32K" = no; # TI BQ32000
  "RTC_DRV_S35390A" = no; # Seiko Instruments S-35390A
  "RTC_DRV_FM3130" = no; # Ramtron FM3130
  "RTC_DRV_RX8010" = no; # Epson RX8010SJ
  "RTC_DRV_RX8581" = no; # Epson RX-8571/RX-8581
  "RTC_DRV_RX8025" = no; # Epson RX-8025SA/NB
  "RTC_DRV_EM3027" = no; # EM Microelectronic EM3027
  "RTC_DRV_RV3028" = no; # Micro Crystal RV3028
  "RTC_DRV_RV3032" = no; # Micro Crystal RV3032
  "RTC_DRV_RV8803" = no; # Micro Crystal RV8803, Epson RX8900
  "RTC_DRV_SD3078" = no; # ZXW Shenzhen whwave SD3078
  "RTC_DRV_M41T93" = no; # ST M41T93
  "RTC_DRV_M41T94" = no; # ST M41T94
  "RTC_DRV_DS1302" = no; # Dallas/Maxim DS1302
  "RTC_DRV_DS1305" = no; # Dallas/Maxim DS1305/DS1306
  "RTC_DRV_DS1343" = no; # Dallas/Maxim DS1343/DS1344
  "RTC_DRV_DS1347" = no; # Dallas/Maxim DS1347
  "RTC_DRV_DS1390" = no; # Dallas/Maxim DS1390/93/94
  "RTC_DRV_MAX6916" = no; # Maxim MAX6916
  "RTC_DRV_R9701" = no; # Epson RTC-9701JE
  "RTC_DRV_RX4581" = no; # Epson RX-4581
  "RTC_DRV_RX6110" = no; # Epson RX-6110
  "RTC_DRV_RS5C348" = no; # Ricoh RS5C348A/B
  "RTC_DRV_MAX6902" = no; # Maxim MAX6902
  "RTC_DRV_PCF2123" = no; # NXP PCF2123
  "RTC_DRV_MCP795" = no; # Microchip MCP795
  "RTC_DRV_DS3232" = no; # Dallas/Maxim DS3232/DS3234
  "RTC_DRV_PCF2127" = no; # NXP PCF2127
  "RTC_DRV_RV3029C2" = no; # Micro Crystal RV3029/3049
  "RTC_DRV_DS1286" = no; # Dallas DS1286
  "RTC_DRV_DS1511" = no; # Dallas DS1511
  "RTC_DRV_DS1553" = no; # Maxim/Dallas DS1553
  "RTC_DRV_DS1685_FAMILY" = no; # Dallas/Maxim DS1685 Family
  "RTC_DRV_DS1742" = no; # Maxim/Dallas DS1742/1743
  "RTC_DRV_DS2404" = no; # Maxim/Dallas DS2404
  "RTC_DRV_EFI" = no; # EFI RTC
  "RTC_DRV_STK17TA8" = no; # Simtek STK17TA8
  "RTC_DRV_M48T86" = no; # ST M48T86/Dallas DS12887
  "RTC_DRV_M48T35" = no; # ST M48T35
  "RTC_DRV_M48T59" = no; # ST M48T59/M48T08/M48T02
  "RTC_DRV_MSM6242" = no; # Oki MSM6242
  "RTC_DRV_BQ4802" = no; # TI BQ4802
  "RTC_DRV_RP5C01" = no; # Ricoh RP5C01
  "RTC_DRV_V3020" = no; # EM Microelectronic V3020
  "RTC_DRV_ZYNQMP" = no; # Xilinx Zynq Ultrascale+ MPSoC RTC
  "RTC_DRV_CADENCE" = no; # Cadence RTC driver
  "RTC_DRV_FTRTC010" = no; # Faraday Technology FTRTC010 RTC
  "RTC_DRV_R7301" = no; # EPSON TOYOCOM RTC-7301SF/DG
  "DMADEVICES" = yes; # DMA Engine support
  "DMADEVICES_DEBUG" = no; # DMA Engine debugging
  "ALTERA_MSGDMA" = no; # Altera / Intel mSGDMA Engine
  "DW_AXI_DMAC" = no; # Synopsys DesignWare AXI DMA support
  "FSL_EDMA" = no; # Freescale eDMA engine support
  "INTEL_IDMA64" = no; # Intel integrated DMA 64-bit support
  "XILINX_ZYNQMP_DPDMA" = no; # Xilinx DPDMA Engine
  "QCOM_HIDMA_MGMT" = no; # Qualcomm Technologies HIDMA Management support
  "QCOM_HIDMA" = no; # Qualcomm Technologies HIDMA Channel support
  "DW_DMAC" = no; # Synopsys DesignWare AHB DMA platform driver
  "SF_PDMA" = no; # Sifive PDMA controller driver
  "DW_DMAC_CVITEK" = yes; # cvitek dma engine based DW DMAC
  "ASYNC_TX_DMA" = no; # Async_tx: Offload support for the async_tx api
  "DMATEST" = no; # DMA Test client

  ### Device Drivers -> DMABUF options
  "SYNC_FILE" = no; # Explicit Synchronization Framework
  "UDMABUF" = no; # userspace dmabuf misc driver
  "DMABUF_MOVE_NOTIFY" = no; # Move notify between drivers (EXPERIMENTAL)
  "DMABUF_SELFTESTS" = no; # Selftests for the dma-buf interfaces
  "DMABUF_HEAPS" = no; # DMA-BUF Userland Memory Heaps
  ### Device Drivers: end of DMABUF options

  "AUXDISPLAY" = no; # Auxiliary Display support
  "UIO" = no; # Userspace I/O drivers
  "VIRT_DRIVERS" = no; # Virtualization drivers
  "VIRTIO_MENU" = no; # Virtio drivers
  "VDPA" = no; # vDPA drivers
  "VHOST_MENU" = yes; # VHOST drivers
  "VHOST_NET" = no; # Host kernel accelerator for virtio net
  "VHOST_CROSS_ENDIAN_LEGACY" = no; # Cross-endian support for vhost
  "GREYBUS" = no; # Greybus support
  "STAGING" = yes; # Staging drivers
  "PRISM2_USB" = no; # Prism2.5/3 USB driver
  "COMEDI" = no; # Data acquisition support (comedi)
  "RTLLIB" = no; # Support for rtllib wireless devices
  "RTL8723BS" = no; # Realtek RTL8723BS SDIO Wireless LAN NIC driver
  "R8712U" = no; # RealTek RTL8712U (RTL8192SU) Wireless LAN NIC driver
  "R8188EU" = no; # Realtek RTL8188EU Wireless LAN NIC driver
  "STAGING_MEDIA" = no; # Media staging drivers

  #### Android
  "ASHMEM" = no; # Enable the Anonymous Shared Memory Subsystem
  "ION" = yes; # Ion Memory Manager
  "ION_SYSTEM_HEAP" = yes; # Ion system heap
  "ION_CARVEOUT_HEAP" = yes; # Ion carveout heap support
  "ION_CHUNK_HEAP" = no; # Ion chunk heap support
  "ION_CMA_HEAP" = yes; # Ion CMA heap support
  "ION_CVITEK" = yes; # Ion for Cvitek
  #### end of Android

  "STAGING_BOARD" = no; # Staging Board Support
  "LTE_GDM724X" = no; # GCT GDM724x LTE support
  "GS_FPGABOOT" = no; # Xilinx FPGA firmware download module
  "UNISYSSPAR" = no; # Unisys SPAR driver support
  "FB_TFT" = no; # Support for small TFT LCD display modules
  "KS7010" = no; # KeyStream KS7010 SDIO support
  "PI433" = no; # Pi433 - a 433MHz radio module for Raspberry Pi
  "XIL_AXIS_FIFO" = no; # Xilinx AXI-Stream FIFO IP core driver
  "FIELDBUS_DEV" = no; # Fieldbus Device Support
  "GOLDFISH" = no; # Platform support for Goldfish virtual devices
  "COMMON_CLK" = yes; # Common Clock Framework
  "COMMON_CLK_MAX9485" = no; # Maxim 9485 Programmable Clock Generator
  "COMMON_CLK_SI5341" = no; # Clock driver for SiLabs 5341 and 5340 A/B/C/D devices
  "COMMON_CLK_SI5351" = no; # Clock driver for SiLabs 5351A/B/C
  "COMMON_CLK_SI514" = no; # Clock driver for SiLabs 514 devices
  "COMMON_CLK_SI544" = no; # Clock driver for SiLabs 544 devices
  "COMMON_CLK_SI570" = no; # Clock driver for SiLabs 570 and compatible devices
  "COMMON_CLK_CDCE706" = no; # Clock driver for TI CDCE706 clock synthesizer
  "COMMON_CLK_CDCE925" = no; # Clock driver for TI CDCE913/925/937/949 devices
  "COMMON_CLK_CS2000_CP" = no; # Clock driver for CS2000 Fractional-N Clock Synthesizer & Clock Multiplier
  "COMMON_CLK_PWM" = no; # Clock driver for PWMs used as clock outputs
  "COMMON_CLK_VC5" = no; # Clock driver for IDT VersaClock 5,6 devices
  "COMMON_CLK_FIXED_MMIO" = no; # Clock driver for Memory Mapped Fixed values
  "CLK_SIFIVE" = no; # SiFive SoC driver support
  "COMMON_CLK_CVITEK" = yes; # Clock driver for CVITEK SoC Family
  "COMMON_CLK_CV1832_TPU_500M" = no; # Set TPU clock to 500MHz for CV1832
  "HWSPINLOCK" = no; # Hardware Spinlock drivers

  ### Device Drivers -> Clock Source drivers
  "MICROCHIP_PIT64B" = no; # Microchip PIT64B support
  ### Device Drivers: end of Clock Source drivers

  "MAILBOX" = no; # Mailbox Hardware Support
  "IOMMU_SUPPORT" = no; # IOMMU Hardware Support

  ### Device Drivers -> Remoteproc drivers
  "REMOTEPROC" = no; # Support for Remote Processor subsystem
  ### Device Drivers: end of Remoteproc drivers

  ### Device Drivers -> Rpmsg drivers
  "RPMSG_VIRTIO" = no; # Virtio RPMSG bus driver
  ### Device Drivers: end of Rpmsg drivers

  "SOUNDWIRE" = no; # SoundWire support

  ### Device Drivers -> SOC (System On Chip) specific Drivers
  "SOC_TI" = no; # TI SOC drivers support

  #### Device Drivers -> SOC (System On Chip) specific Drivers -> Xilinx SoC drivers
  "XILINX_VCU" = no; # Xilinx VCU logicoreIP Init
  #### Device Drivers -> SOC (System On Chip) specific Drivers: end of Xilinx SoC drivers

  #### Device Drivers -> SOC (System On Chip) specific Drivers -> CVITEK SoC drivers
  "CV1835_SYSDMA_REMAP" = yes; # CVITEK SoC sysdma remap driver
  "CVI_WIFI_PIN" = no; # CVITEK SoC wifi specific pin definition
  "CVI_BT_PIN" = no; # CVITEK SoC BT specific pin definition
  "CVI_MAILBOX" = yes; # cv180x/cv181x mailbox dirver
  #### Device Drivers -> SOC (System On Chip) specific Drivers: end of CVITEK SoC drivers
  ### Device Drivers: end of SOC (System On Chip) specific Drivers

  "PM_DEVFREQ" = no; # Generic Dynamic Voltage and Frequency Scaling (DVFS) support
  "EXTCON" = no; # External Connector Class (extcon) support
  "MEMORY" = no; # Memory Controller drivers
  "IIO" = no; # Industrial I/O support
  "PWM" = yes; # Pulse-Width Modulation (PWM) Support
  "PWM_DEBUG" = no; # PWM lowlevel drivers additional checks and debug messages
  "PWM_FSL_FTM" = no; # Freescale FlexTimer Module (FTM) PWM support
  "PWM_PCA9685" = no; # NXP PCA9685 PWM driver
  "PWM_SIFIVE" = no; # SiFive PWM support

  ### Device Drivers -> IRQ chip support
  "AL_FIC" = no; # Amazon's Annapurna Labs Fabric Interrupt Controller
  "RISCV_INTC" = yes; # RISC-V Local Interrupt Controller
  "SIFIVE_PLIC" = yes; # SiFive Platform-Level Interrupt Controller
  ### Device Drivers: end of IRQ chip support

  "IPACK_BUS" = no; # IndustryPack bus support
  "RESET_CONTROLLER" = yes; # Reset Controller Support
  "RESET_BRCMSTB_RESCAL" = no; # Broadcom STB RESCAL reset controller
  "RESET_INTEL_GW" = no; # Intel Reset Controller Driver
  "RESET_TI_SYSCON" = no; # TI SYSCON Reset Driver

  ### Device Drivers -> PHY Subsystem
  "GENERIC_PHY" = no; # PHY Core
  "USB_LGM_PHY" = no; # INTEL Lightning Mountain USB PHY Driver
  "BCM_KONA_USB2_PHY" = no; # Broadcom Kona USB2 PHY Driver
  "PHY_CADENCE_TORRENT" = no; # Cadence Torrent PHY driver
  "PHY_CADENCE_DPHY" = no; # Cadence D-PHY Support
  "PHY_CADENCE_SIERRA" = no; # Cadence Sierra PHY Driver
  "PHY_CADENCE_SALVO" = no; # Cadence Salvo PHY Driver
  "PHY_FSL_IMX8MQ_USB" = no; # Freescale i.MX8M USB3 PHY
  "PHY_MIXEL_MIPI_DPHY" = no; # Mixel MIPI DSI PHY support
  "PHY_PXA_28NM_HSIC" = no; # Marvell USB HSIC 28nm PHY Driver
  "PHY_PXA_28NM_USB2" = no; # Marvell USB 2.0 28nm PHY Driver
  "PHY_MAPPHONE_MDM6600" = no; # Motorola Mapphone MDM6600 modem USB PHY driver
  "PHY_OCELOT_SERDES" = no; # SerDes PHY driver for Microsemi Ocelot
  "PHY_SAMSUNG_USB2" = no; # Samsung USB 2.0 PHY driver
  ### Device Drivers: end of PHY Subsystem

  "POWERCAP" = no; # Generic powercap sysfs driver
  "MCB" = no; # MCB support
  "RAS" = no; # Reliability, Availability and Serviceability (RAS) features

  ### Device Drivers -> Android
  "ANDROID" = yes; # Android Drivers
  "ANDROID_BINDER_IPC" = no; # Android Binder IPC Driver
  ### Device Drivers: end of Android

  "LIBNVDIMM" = no; # NVDIMM (Non-Volatile Memory Device) Support
  "DAX" = no; # DAX: direct access to differentiated memory
  "NVMEM" = yes; # NVMEM Support
  "NVMEM_SYSFS" = yes; # /sys/bus/nvmem/devices/*/nvmem (sysfs interface)

  ### Device Drivers -> HW tracing support
  "STM" = no; # System Trace Module devices
  "INTEL_TH" = no; # Intel(R) Trace Hub controller
  ### Device Drivers: end of HW tracing support

  "FPGA" = no; # FPGA Configuration Framework
  "FSI" = no; # FSI support
  "SIOX" = no; # Eckelmann SIOX Support
  "SLIMBUS" = no; # SLIMbus support
  "INTERCONNECT" = no; # On-Chip Interconnect management support
  "COUNTER" = no; # Counter support
  "MOST" = no; # MOST support
  "EFUSE" = yes; # Efuse drivers
  "CV181X_EFUSE" = yes; # Efuse driver for CVITEK CV181X
  ## end of Device Drivers

  ## File systems
  "VALIDATE_FS_PARSER" = no; # Validate filesystem parameter description
  "EXT2_FS" = no; # Second extended fs support
  "EXT3_FS" = yes; # The Extended 3 (ext3) filesystem
  "EXT3_FS_POSIX_ACL" = no; # Ext3 POSIX Access Control Lists
  "EXT3_FS_SECURITY" = no; # Ext3 Security Labels
  "EXT4_FS" = yes; # The Extended 4 (ext4) filesystem
  "EXT4_USE_FOR_EXT2" = yes; # Use ext4 for ext2 file systems
  "EXT4_FS_POSIX_ACL" = no; # Ext4 POSIX Access Control Lists
  "EXT4_FS_SECURITY" = no; # Ext4 Security Labels
  "EXT4_DEBUG" = yes; # Ext4 debugging support
  "JBD2_DEBUG" = no; # JBD2 (ext4) debugging support
  "REISERFS_FS" = no; # Reiserfs support
  "JFS_FS" = no; # JFS filesystem support
  "XFS_FS" = no; # XFS filesystem support
  "GFS2_FS" = no; # GFS2 file system support
  "OCFS2_FS" = no; # OCFS2 file system support
  "BTRFS_FS" = no; # Btrfs filesystem support
  "NILFS2_FS" = no; # NILFS2 file system support
  "F2FS_FS" = no; # F2FS filesystem support
  "FS_DAX" = no; # Direct Access (DAX) support
  "EXPORTFS_BLOCK_OPS" = no; # Enable filesystem export operations for block IO
  "FILE_LOCKING" = yes; # Enable POSIX file locking API
  "MANDATORY_FILE_LOCKING" = no; # Enable Mandatory file locking
  "FS_ENCRYPTION" = no; # FS Encryption (Per-file encryption)
  "FS_VERITY" = no; # FS Verity (read-only file-based authenticity protection)
  "DNOTIFY" = yes; # Dnotify support
  "INOTIFY_USER" = yes; # Inotify support for userspace
  "FANOTIFY" = no; # Filesystem wide access notification
  "QUOTA" = no; # Quota support
  "AUTOFS4_FS" = yes; # Old Kconfig name for Kernel automounter support
  "AUTOFS_FS" = yes; # Kernel automounter support (supports v3, v4 and v5)
  "FUSE_FS" = no; # FUSE (Filesystem in Userspace) support
  "OVERLAY_FS" = yes; # Overlay filesystem support

  ### File systems -> Caches
  "FSCACHE" = no; # General filesystem local caching manager
  ### File systems: end of Caches

  ### File systems -> CD-ROM/DVD Filesystems
  "ISO9660_FS" = no; # ISO 9660 CDROM file system support
  "UDF_FS" = no; # UDF file system support
  ### File systems: end of CD-ROM/DVD Filesystems

  ### File systems -> DOS/FAT/EXFAT/NT Filesystems
  "MSDOS_FS" = yes; # MSDOS fs support
  "VFAT_FS" = yes; # VFAT (Windows-95) fs support
  "FAT_DEFAULT_CODEPAGE" = freeform "437"; # Default codepage for FAT
  "FAT_DEFAULT_IOCHARSET" = freeform "iso8859-1"; # Default iocharset for FAT
  "FAT_DEFAULT_UTF8" = no; # Enable FAT UTF-8 option by default
  "EXFAT_FS" = no; # exFAT filesystem support
  "NTFS_FS" = no; # NTFS file system support
  ### File systems: end of DOS/FAT/EXFAT/NT Filesystems

  ### File systems -> Pseudo filesystems
  "PROC_FS" = yes; # /proc file system support
  "PROC_KCORE" = no; # /proc/kcore support
  "PROC_SYSCTL" = yes; # Sysctl support (/proc/sys)
  "PROC_PAGE_MONITOR" = no; # Enable /proc page monitoring
  "PROC_CHILDREN" = no; # Include /proc/<pid>/task/<tid>/children file
  "SYSFS" = yes; # sysfs file system support
  "TMPFS" = yes; # Tmpfs virtual memory file system support (former shm fs)
  "TMPFS_POSIX_ACL" = yes; # Tmpfs POSIX Access Control Lists
  "TMPFS_XATTR" = yes; # Tmpfs extended attributes
  "TMPFS_INODE64" = no; # Use 64-bit ino_t by default in tmpfs
  "HUGETLBFS" = no; # HugeTLB file system support
  "CONFIGFS_FS" = yes; # Userspace-driven configuration filesystem
  "EFIVAR_FS" = module; # EFI Variable filesystem
  ### File systems: end of Pseudo filesystems

  "MISC_FILESYSTEMS" = yes; # Miscellaneous filesystems
  "ORANGEFS_FS" = no; # ORANGEFS (Powered by PVFS) support
  "ADFS_FS" = no; # ADFS file system support
  "AFFS_FS" = no; # Amiga FFS file system support
  "ECRYPT_FS" = no; # eCrypt filesystem layer support
  "HFS_FS" = no; # Apple Macintosh file system support
  "HFSPLUS_FS" = no; # Apple Extended HFS file system support
  "BEFS_FS" = no; # BeOS file system (BeFS) support (read only)
  "BFS_FS" = no; # BFS file system support
  "EFS_FS" = no; # EFS file system support (read only)
  "JFFS2_FS" = yes; # Journalling Flash File System v2 (JFFS2) support
  "JFFS2_FS_DEBUG" = freeform "0"; # JFFS2 debugging verbosity (0 = quiet, 2 = noisy)
  "JFFS2_FS_WRITEBUFFER" = yes; # JFFS2 write-buffering support
  "JFFS2_FS_WBUF_VERIFY" = yes; # Verify JFFS2 write-buffer reads
  "JFFS2_SUMMARY" = no; # JFFS2 summary support
  "JFFS2_FS_XATTR" = no; # JFFS2 XATTR support
  "JFFS2_COMPRESSION_OPTIONS" = no; # Advanced compression options for JFFS2
  "UBIFS_FS" = yes; # UBIFS file system support
  "UBIFS_FS_ADVANCED_COMPR" = no; # Advanced compression options
  "UBIFS_ATIME_SUPPORT" = no; # Access time support
  "UBIFS_FS_XATTR" = yes; # UBIFS XATTR support
  "UBIFS_FS_SECURITY" = yes; # UBIFS Security Labels
  "UBIFS_FS_AUTHENTICATION" = no; # UBIFS authentication support
  "CRAMFS" = no; # Compressed ROM file system support (cramfs)
  "SQUASHFS" = yes; # SquashFS 4.0 - Squashed file system support
  "SQUASHFS_FILE_CACHE" = yes; # Decompress file data into an intermediate buffer
  "SQUASHFS_FILE_DIRECT" = no; # Decompress files directly into the page cache
  "SQUASHFS_DECOMP_SINGLE" = yes; # Single threaded compression
  "SQUASHFS_DECOMP_MULTI" = no; # Use multiple decompressors for parallel I/O
  "SQUASHFS_DECOMP_MULTI_PERCPU" = no; # Use percpu multiple decompressors for parallel I/O
  "SQUASHFS_XATTR" = no; # Squashfs XATTR support
  "SQUASHFS_ZLIB" = no; # Include support for ZLIB compressed file systems
  "SQUASHFS_LZ4" = no; # Include support for LZ4 compressed file systems
  "SQUASHFS_LZO" = no; # Include support for LZO compressed file systems
  "SQUASHFS_XZ" = yes; # Include support for XZ compressed file systems
  "SQUASHFS_ZSTD" = no; # Include support for ZSTD compressed file systems
  "SQUASHFS_4K_DEVBLK_SIZE" = no; # Use 4K device block size?
  "SQUASHFS_EMBEDDED" = no; # Additional option for memory-constrained systems
  "VXFS_FS" = no; # FreeVxFS file system support (VERITAS VxFS(TM) compatible)
  "MINIX_FS" = no; # Minix file system support
  "OMFS_FS" = no; # SonicBlue Optimized MPEG File System support
  "HPFS_FS" = no; # OS/2 HPFS file system support
  "QNX4FS_FS" = no; # QNX4 file system support (read only)
  "QNX6FS_FS" = no; # QNX6 file system support (read only)
  "ROMFS_FS" = no; # ROM file system support
  "PSTORE" = no; # Persistent store support
  "SYSV_FS" = no; # System V/Xenix/V7/Coherent file system support
  "UFS_FS" = no; # UFS file system support (read only)
  "EROFS_FS" = no; # EROFS filesystem support
  "NETWORK_FILESYSTEMS" = yes; # Network File Systems
  "NFS_FS" = yes; # NFS client support
  "NFS_V2" = yes; # NFS client support for NFS version 2
  "NFS_V3" = yes; # NFS client support for NFS version 3
  "NFS_V3_ACL" = no; # NFS client support for the NFSv3 ACL protocol extension
  "NFS_V4" = no; # NFS client support for NFS version 4
  "NFS_SWAP" = no; # Provide swap over NFS support
  "NFS_DISABLE_UDP_SUPPORT" = yes; # NFS: Disable NFS UDP protocol support
  "NFSD" = no; # NFS server support
  "SUNRPC_DEBUG" = no; # RPC: Enable dprintk debugging
  "CEPH_FS" = no; # Ceph distributed file system
  "CIFS" = no; # SMB3 and CIFS support (advanced network filesystem)
  "CODA_FS" = no; # Coda file system support (advanced network fs)
  "AFS_FS" = no; # Andrew File System support (AFS)
  "NLS" = yes; # Native language support
  "NLS_DEFAULT" = freeform "iso8859-1"; # Default NLS Option
  "NLS_CODEPAGE_437" = yes; # Codepage 437 (United States, Canada)
  "NLS_CODEPAGE_737" = no; # Codepage 737 (Greek)
  "NLS_CODEPAGE_775" = no; # Codepage 775 (Baltic Rim)
  "NLS_CODEPAGE_850" = no; # Codepage 850 (Europe)
  "NLS_CODEPAGE_852" = no; # Codepage 852 (Central/Eastern Europe)
  "NLS_CODEPAGE_855" = no; # Codepage 855 (Cyrillic)
  "NLS_CODEPAGE_857" = no; # Codepage 857 (Turkish)
  "NLS_CODEPAGE_860" = no; # Codepage 860 (Portuguese)
  "NLS_CODEPAGE_861" = no; # Codepage 861 (Icelandic)
  "NLS_CODEPAGE_862" = no; # Codepage 862 (Hebrew)
  "NLS_CODEPAGE_863" = no; # Codepage 863 (Canadian French)
  "NLS_CODEPAGE_864" = no; # Codepage 864 (Arabic)
  "NLS_CODEPAGE_865" = no; # Codepage 865 (Norwegian, Danish)
  "NLS_CODEPAGE_866" = no; # Codepage 866 (Cyrillic/Russian)
  "NLS_CODEPAGE_869" = no; # Codepage 869 (Greek)
  "NLS_CODEPAGE_936" = no; # Simplified Chinese charset (CP936, GB2312)
  "NLS_CODEPAGE_950" = no; # Traditional Chinese charset (Big5)
  "NLS_CODEPAGE_932" = no; # Japanese charsets (Shift-JIS, EUC-JP)
  "NLS_CODEPAGE_949" = no; # Korean charset (CP949, EUC-KR)
  "NLS_CODEPAGE_874" = no; # Thai charset (CP874, TIS-620)
  "NLS_ISO8859_8" = no; # Hebrew charsets (ISO-8859-8, CP1255)
  "NLS_CODEPAGE_1250" = no; # Windows CP1250 (Slavic/Central European Languages)
  "NLS_CODEPAGE_1251" = no; # Windows CP1251 (Bulgarian, Belarusian)
  "NLS_ASCII" = no; # ASCII (United States)
  "NLS_ISO8859_1" = yes; # NLS ISO 8859-1  (Latin 1; Western European Languages)
  "NLS_ISO8859_2" = yes; # NLS ISO 8859-2  (Latin 2; Slavic/Central European Languages)
  "NLS_ISO8859_3" = yes; # NLS ISO 8859-3  (Latin 3; Esperanto, Galician, Maltese, Turkish)
  "NLS_ISO8859_4" = no; # NLS ISO 8859-4  (Latin 4; old Baltic charset)
  "NLS_ISO8859_5" = no; # NLS ISO 8859-5  (Cyrillic)
  "NLS_ISO8859_6" = no; # NLS ISO 8859-6  (Arabic)
  "NLS_ISO8859_7" = no; # NLS ISO 8859-7  (Modern Greek)
  "NLS_ISO8859_9" = no; # NLS ISO 8859-9  (Latin 5; Turkish)
  "NLS_ISO8859_13" = no; # NLS ISO 8859-13 (Latin 7; Baltic)
  "NLS_ISO8859_14" = no; # NLS ISO 8859-14 (Latin 8; Celtic)
  "NLS_ISO8859_15" = no; # NLS ISO 8859-15 (Latin 9; Western European Languages with Euro)
  "NLS_KOI8_R" = no; # NLS KOI8-R (Russian)
  "NLS_KOI8_U" = no; # NLS KOI8-U/RU (Ukrainian, Belarusian)
  "NLS_MAC_ROMAN" = no; # Codepage macroman
  "NLS_MAC_CELTIC" = no; # Codepage macceltic
  "NLS_MAC_CENTEURO" = no; # Codepage maccenteuro
  "NLS_MAC_CROATIAN" = no; # Codepage maccroatian
  "NLS_MAC_CYRILLIC" = no; # Codepage maccyrillic
  "NLS_MAC_GAELIC" = no; # Codepage macgaelic
  "NLS_MAC_GREEK" = no; # Codepage macgreek
  "NLS_MAC_ICELAND" = no; # Codepage maciceland
  "NLS_MAC_INUIT" = no; # Codepage macinuit
  "NLS_MAC_ROMANIAN" = no; # Codepage macromanian
  "NLS_MAC_TURKISH" = no; # Codepage macturkish
  "NLS_UTF8" = no; # NLS UTF-8
  "DLM" = no; # Distributed Lock Manager (DLM)
  "UNICODE" = no; # UTF-8 normalization and casefolding support
  ## end of File systems

  ## Security options
  "KEYS" = yes; # Enable access key retention support
  "KEYS_REQUEST_CACHE" = no; # Enable temporary caching of the last request_key() result
  "PERSISTENT_KEYRINGS" = no; # Enable register of persistent per-UID keyrings
  "ENCRYPTED_KEYS" = no; # ENCRYPTED KEYS
  "KEY_DH_OPERATIONS" = no; # Diffie-Hellman operations on retained keys
  "SECURITY_DMESG_RESTRICT" = no; # Restrict unprivileged access to the kernel syslog
  "SECURITY" = no; # Enable different security models
  "SECURITYFS" = no; # Enable the securityfs filesystem
  "HARDENED_USERCOPY" = no; # Harden memory copies between kernel and userspace
  "STATIC_USERMODEHELPER" = no; # Force all usermode helper calls through a single binary
  "DEFAULT_SECURITY_DAC" = yes; # Unix Discretionary Access Controls
  "LSM" = freeform "lockdown,yama,loadpin,safesetid,integrity,bpf"; # Ordered list of enabled LSMs

  ### Security options -> Kernel hardening options

  #### Security options -> Kernel hardening options -> Memory initialization
  "INIT_STACK_NONE" = yes; # no automatic initialization (weakest)
  "INIT_ON_ALLOC_DEFAULT_ON" = no; # Enable heap memory zeroing on allocation by default
  "INIT_ON_FREE_DEFAULT_ON" = no; # Enable heap memory zeroing on free by default
  #### Security options -> Kernel hardening options: end of Memory initialization
  ### Security options: end of Kernel hardening options
  ## end of Security options

  "CRYPTO" = yes; # Cryptographic API
  "CRYPTO_MANAGER" = yes; # Cryptographic algorithm manager
  "CRYPTO_USER" = no; # Userspace cryptographic algorithm configuration
  "CRYPTO_MANAGER_DISABLE_TESTS" = yes; # Disable run-time self tests
  "CRYPTO_NULL" = no; # Null algorithms
  "CRYPTO_CRYPTD" = no; # Software async crypto daemon
  "CRYPTO_AUTHENC" = no; # Authenc support
  "CRYPTO_TEST" = no; # Testing module
  "CRYPTO_RSA" = yes; # RSA algorithm
  "CRYPTO_DH" = no; # Diffie-Hellman algorithm
  "CRYPTO_ECDH" = no; # ECDH algorithm
  "CRYPTO_ECRDSA" = no; # EC-RDSA (GOST 34.10) algorithm
  "CRYPTO_SM2" = no; # SM2 algorithm
  "CRYPTO_CURVE25519" = no; # Curve25519 algorithm
  "CRYPTO_CCM" = no; # CCM support
  "CRYPTO_GCM" = no; # GCM/GMAC support
  "CRYPTO_CHACHA20POLY1305" = no; # ChaCha20-Poly1305 AEAD support
  "CRYPTO_AEGIS128" = no; # AEGIS-128 AEAD algorithm
  "CRYPTO_SEQIV" = no; # Sequence Number IV Generator
  "CRYPTO_ECHAINIV" = no; # Encrypted Chain IV Generator
  "CRYPTO_CBC" = no; # CBC support
  "CRYPTO_CFB" = no; # CFB support
  "CRYPTO_CTR" = no; # CTR support
  "CRYPTO_CTS" = no; # CTS support
  "CRYPTO_ECB" = no; # ECB support
  "CRYPTO_LRW" = no; # LRW support
  "CRYPTO_OFB" = no; # OFB support
  "CRYPTO_PCBC" = no; # PCBC support
  "CRYPTO_XTS" = no; # XTS support
  "CRYPTO_KEYWRAP" = no; # Key wrapping support
  "CRYPTO_ADIANTUM" = no; # Adiantum support
  "CRYPTO_ESSIV" = no; # ESSIV support for block encryption
  "CRYPTO_CMAC" = no; # CMAC support
  "CRYPTO_HMAC" = yes; # HMAC support
  "CRYPTO_XCBC" = no; # XCBC support
  "CRYPTO_VMAC" = no; # VMAC support
  "CRYPTO_CRC32C" = yes; # CRC32c CRC algorithm
  "CRYPTO_CRC32" = no; # CRC32 CRC algorithm
  "CRYPTO_XXHASH" = no; # xxHash hash algorithm
  "CRYPTO_BLAKE2B" = no; # BLAKE2b digest algorithm
  "CRYPTO_BLAKE2S" = no; # BLAKE2s digest algorithm
  "CRYPTO_CRCT10DIF" = no; # CRCT10DIF algorithm
  "CRYPTO_GHASH" = no; # GHASH hash function
  "CRYPTO_POLY1305" = no; # Poly1305 authenticator algorithm
  "CRYPTO_MD4" = no; # MD4 digest algorithm
  "CRYPTO_MD5" = no; # MD5 digest algorithm
  "CRYPTO_MICHAEL_MIC" = no; # Michael MIC keyed digest algorithm
  "CRYPTO_RMD128" = no; # RIPEMD-128 digest algorithm
  "CRYPTO_RMD160" = no; # RIPEMD-160 digest algorithm
  "CRYPTO_RMD256" = no; # RIPEMD-256 digest algorithm
  "CRYPTO_RMD320" = no; # RIPEMD-320 digest algorithm
  "CRYPTO_SHA1" = no; # SHA1 digest algorithm
  "CRYPTO_SHA256" = yes; # SHA224 and SHA256 digest algorithm
  "CRYPTO_SHA512" = no; # SHA384 and SHA512 digest algorithms
  "CRYPTO_SHA3" = no; # SHA3 digest algorithm
  "CRYPTO_SM3" = no; # SM3 digest algorithm
  "CRYPTO_STREEBOG" = no; # Streebog Hash Function
  "CRYPTO_TGR192" = no; # Tiger digest algorithms
  "CRYPTO_WP512" = no; # Whirlpool digest algorithms
  "CRYPTO_AES" = no; # AES cipher algorithms
  "CRYPTO_AES_TI" = no; # Fixed time AES cipher
  "CRYPTO_BLOWFISH" = no; # Blowfish cipher algorithm
  "CRYPTO_CAMELLIA" = no; # Camellia cipher algorithms
  "CRYPTO_CAST5" = no; # CAST5 (CAST-128) cipher algorithm
  "CRYPTO_CAST6" = no; # CAST6 (CAST-256) cipher algorithm
  "CRYPTO_DES" = no; # DES and Triple DES EDE cipher algorithms
  "CRYPTO_FCRYPT" = no; # FCrypt cipher algorithm
  "CRYPTO_SALSA20" = no; # Salsa20 stream cipher algorithm
  "CRYPTO_CHACHA20" = no; # ChaCha stream cipher algorithms
  "CRYPTO_SERPENT" = no; # Serpent cipher algorithm
  "CRYPTO_SM4" = no; # SM4 cipher algorithm
  "CRYPTO_TWOFISH" = no; # Twofish cipher algorithm
  "CRYPTO_DEFLATE" = yes; # Deflate compression algorithm
  "CRYPTO_LZO" = yes; # LZO compression algorithm
  "CRYPTO_842" = no; # 842 compression algorithm
  "CRYPTO_LZ4" = no; # LZ4 compression algorithm
  "CRYPTO_LZ4HC" = no; # LZ4HC compression algorithm
  "CRYPTO_ZSTD" = yes; # Zstd compression algorithm
  "CRYPTO_ANSI_CPRNG" = no; # Pseudo Random Number Generation for Cryptographic modules
  "CRYPTO_DRBG_MENU" = no; # NIST SP800-90A DRBG
  "CRYPTO_JITTERENTROPY" = no; # Jitterentropy Non-Deterministic Random Number Generator
  "CRYPTO_USER_API_HASH" = yes; # User-space interface for hash algorithms
  "CRYPTO_USER_API_SKCIPHER" = no; # User-space interface for symmetric key cipher algorithms
  "CRYPTO_USER_API_RNG" = no; # User-space interface for random number generator algorithms
  "CRYPTO_USER_API_AEAD" = no; # User-space interface for AEAD cipher algorithms
  "CRYPTO_LIB_BLAKE2S" = no; # BLAKE2s hash function library
  "CRYPTO_LIB_CHACHA" = no; # ChaCha library interface
  "CRYPTO_LIB_CURVE25519" = no; # Curve25519 scalar multiplication library
  "CRYPTO_LIB_POLY1305" = no; # Poly1305 library interface
  "CRYPTO_LIB_CHACHA20POLY1305" = no; # ChaCha20-Poly1305 AEAD support (8-byte nonce library version)
  "CRYPTO_HW" = no; # Hardware crypto devices
  "ASYMMETRIC_KEY_TYPE" = yes; # Asymmetric (public-key cryptographic) key type
  "ASYMMETRIC_PUBLIC_KEY_SUBTYPE" = yes; # Asymmetric public-key crypto algorithm subtype
  "X509_CERTIFICATE_PARSER" = yes; # X.509 certificate parser
  "PKCS8_PRIVATE_KEY_PARSER" = no; # PKCS#8 private key parser
  "PKCS7_MESSAGE_PARSER" = yes; # PKCS#7 message parser
  "PKCS7_TEST_KEY" = no; # PKCS#7 testing key type
  "SIGNED_PE_FILE_VERIFICATION" = no; # Support for PE file signature verification

  ### Certificates for signature checking
  "SYSTEM_TRUSTED_KEYRING" = yes; # Provide system-wide ring of trusted keys
  "SYSTEM_EXTRA_CERTIFICATE" = no; # Reserve area for inserting a certificate without recompiling
  "SECONDARY_TRUSTED_KEYRING" = no; # Provide a keyring to which extra trustable keys may be added
  "SYSTEM_BLACKLIST_KEYRING" = no; # Provide system-wide ring of blacklisted keys
  ### end of Certificates for signature checking

  ## Library routines
  "PACKING" = no; # Generic bitfield packing and unpacking
  "CORDIC" = no; # CORDIC algorithm
  "PRIME_NUMBERS" = no; # Simple prime number generator for testing
  "CRC_CCITT" = no; # CRC-CCITT functions
  "CRC16" = yes; # CRC16 functions
  "CRC_T10DIF" = no; # CRC calculation for the T10 Data Integrity Field
  "CRC_ITU_T" = no; # CRC ITU-T V.41 functions
  "CRC32" = yes; # CRC32/CRC32c functions
  "CRC32_SELFTEST" = no; # CRC32 perform self test on init
  "CRC32_SLICEBY8" = yes; # Slice by 8 bytes
  "CRC32_SLICEBY4" = no; # Slice by 4 bytes
  "CRC32_SARWATE" = no; # Sarwate's Algorithm (one byte at a time)
  "CRC32_BIT" = no; # Classic Algorithm (one bit at a time)
  "CRC64" = no; # CRC64 functions
  "CRC4" = no; # CRC4 functions
  "CRC7" = no; # CRC7 functions
  "LIBCRC32C" = no; # CRC32c (Castagnoli, et al) Cyclic Redundancy-Check
  "CRC8" = no; # CRC8 function
  "RANDOM32_SELFTEST" = no; # PRNG perform self test on init
  "XZ_DEC" = yes; # XZ decompression support
  "XZ_DEC_X86" = no; # x86 BCJ filter decoder
  "XZ_DEC_POWERPC" = no; # PowerPC BCJ filter decoder
  "XZ_DEC_IA64" = no; # IA-64 BCJ filter decoder
  "XZ_DEC_ARM" = yes; # ARM BCJ filter decoder
  "XZ_DEC_ARMTHUMB" = no; # ARM-Thumb BCJ filter decoder
  "XZ_DEC_SPARC" = no; # SPARC BCJ filter decoder
  "XZ_DEC_TEST" = no; # XZ decompressor tester
  "DMA_CMA" = yes; # DMA Contiguous Memory Allocator
  "DMA_PERNUMA_CMA" = no; # Enable separate DMA Contiguous Memory Area for each NUMA Node
  "CMA_SIZE_MBYTES" = freeform "0"; # Size in Mega Bytes
  "CMA_SIZE_SEL_MBYTES" = yes; # Use mega bytes value only
  "CMA_SIZE_SEL_PERCENTAGE" = no; # Use percentage value only
  "CMA_SIZE_SEL_MIN" = no; # Use lower value (minimum)
  "CMA_SIZE_SEL_MAX" = no; # Use higher value (maximum)
  "CMA_ALIGNMENT" = freeform "8"; # Maximum PAGE_SIZE order of alignment for contiguous buffers
  "DMA_API_DEBUG" = no; # Enable debugging of DMA-API usage
  "IRQ_POLL" = no; # IRQ polling library
  "STRING_SELFTEST" = no; # Test string functions
  ## end of Library routines

  ## Kernel hacking

  ### Kernel hacking -> printk and dmesg options
  "PRINTK_TIME" = yes; # Show timing information on printks
  "PRINTK_CALLER" = no; # Show caller information on printks
  "CONSOLE_LOGLEVEL_DEFAULT" = freeform "7"; # Default console loglevel (1-15)
  "CONSOLE_LOGLEVEL_QUIET" = freeform "4"; # quiet console loglevel (1-15)
  "MESSAGE_LOGLEVEL_DEFAULT" = freeform "4"; # Default message log level (1-7)
  "BOOT_PRINTK_DELAY" = no; # Delay each boot printk message by N milliseconds
  "DYNAMIC_DEBUG" = yes; # Enable dynamic printk() support
  "DYNAMIC_DEBUG_CORE" = yes; # Enable core function of dynamic debug support
  "SYMBOLIC_ERRNAME" = yes; # Support symbolic error names in printf
  ### Kernel hacking: end of printk and dmesg options

  ### Kernel hacking -> Compile-time checks and compiler options
  "DEBUG_INFO" = no; # Compile the kernel with debug info
  "ENABLE_MUST_CHECK" = no; # Enable __must_check logic
  "FRAME_WARN" = freeform "2048"; # Warn for stack frames larger than
  "STRIP_ASM_SYMS" = no; # Strip assembler-generated symbols during link
  "READABLE_ASM" = no; # Generate readable assembler code
  "HEADERS_INSTALL" = no; # Install uapi headers to usr/include
  "DEBUG_SECTION_MISMATCH" = no; # Enable full Section mismatch analysis
  "SECTION_MISMATCH_WARN_ONLY" = yes; # Make section mismatch errors non-fatal
  "DEBUG_FORCE_FUNCTION_ALIGN_32B" = no; # Force all function address 32B aligned
  "FRAME_POINTER" = no; # Compile the kernel with frame pointers
  "DEBUG_FORCE_WEAK_PER_CPU" = no; # Force weak per-cpu definitions
  ### Kernel hacking: end of Compile-time checks and compiler options

  ### Kernel hacking -> Generic Kernel Debugging Instruments
  "MAGIC_SYSRQ" = yes; # Magic SysRq key
  "DEBUG_FS" = yes; # Debug Filesystem
  "DEBUG_FS_ALLOW_ALL" = yes; # Access normal
  "DEBUG_FS_DISALLOW_MOUNT" = no; # Do not register debugfs as filesystem
  "DEBUG_FS_ALLOW_NONE" = no; # No access
  "KGDB" = no; # KGDB: kernel debugger
  "UBSAN" = no; # Undefined behaviour sanity checker
  ### Kernel hacking: end of Generic Kernel Debugging Instruments

  "DEBUG_KERNEL" = yes; # Kernel debugging
  "DEBUG_MISC" = no; # Miscellaneous debug code

  ### Kernel hacking -> Memory Debugging
  "PAGE_EXTENSION" = no; # Extend memmap on extra space for more information on page
  "DEBUG_PAGEALLOC" = no; # Debug page memory allocations
  "PAGE_OWNER" = no; # Track page owner
  "PAGE_POISONING" = no; # Poison pages after freeing
  "DEBUG_WX" = no; # Warn on W+X mappings at boot
  "PTDUMP_DEBUGFS" = no; # Export kernel pagetable layout to userspace via debugfs
  "DEBUG_OBJECTS" = no; # Debug object operations
  "SLUB_STATS" = no; # Enable SLUB performance statistics
  "DEBUG_KMEMLEAK" = no; # Kernel memory leak detector
  "DEBUG_STACK_USAGE" = no; # Stack utilization instrumentation
  "SCHED_STACK_END_CHECK" = no; # Detect stack corruption on calls to schedule()
  "DEBUG_VM" = no; # Debug VM
  "DEBUG_VM_PGTABLE" = no; # Debug arch page table for semantics compliance
  "DEBUG_VIRTUAL" = no; # Debug VM translations
  "DEBUG_MEMORY_INIT" = no; # Debug memory initialisation
  "KASAN" = no; # KASAN: runtime memory debugger
  ### Kernel hacking: end of Memory Debugging

  "DEBUG_SHIRQ" = no; # Debug shared IRQ handlers

  ### Kernel hacking -> Debug Oops, Lockups and Hangs
  "PANIC_ON_OOPS" = no; # Panic on Oops
  "PANIC_TIMEOUT" = freeform "0"; # panic timeout
  "SOFTLOCKUP_DETECTOR" = no; # Detect Soft Lockups
  "DETECT_HUNG_TASK" = no; # Detect Hung Tasks
  "WQ_WATCHDOG" = no; # Detect Workqueue Stalls
  "TEST_LOCKUP" = no; # Test module to generate lockups
  ### Kernel hacking: end of Debug Oops, Lockups and Hangs

  ### Kernel hacking -> Scheduler Debugging
  "SCHED_DEBUG" = no; # Collect scheduler debugging info
  "SCHEDSTATS" = no; # Collect scheduler statistics
  ### Kernel hacking: end of Scheduler Debugging

  "DEBUG_TIMEKEEPING" = no; # Enable extra timekeeping sanity checking
  "DEBUG_PREEMPT" = no; # Debug preemptible kernel

  ### Kernel hacking -> Lock Debugging (spinlocks, mutexes, etc...)
  "PROVE_LOCKING" = no; # Lock debugging: prove locking correctness
  "LOCK_STAT" = no; # Lock usage statistics
  "DEBUG_RT_MUTEXES" = no; # RT Mutex debugging, deadlock detection
  "DEBUG_SPINLOCK" = no; # Spinlock and rw-lock debugging: basic checks
  "DEBUG_MUTEXES" = no; # Mutex debugging: basic checks
  "DEBUG_WW_MUTEX_SLOWPATH" = no; # Wait/wound mutex debugging: Slowpath testing
  "DEBUG_RWSEMS" = no; # RW Semaphore debugging: basic checks
  "DEBUG_LOCK_ALLOC" = no; # Lock debugging: detect incorrect freeing of live locks
  "DEBUG_ATOMIC_SLEEP" = no; # Sleep inside atomic section checking
  "DEBUG_LOCKING_API_SELFTESTS" = no; # Locking API boot-time self-tests
  "LOCK_TORTURE_TEST" = no; # torture tests for locking
  "WW_MUTEX_SELFTEST" = no; # Wait/wound mutex selftests
  "SCF_TORTURE_TEST" = no; # torture tests for smp_call_function*()
  "CSD_LOCK_WAIT_DEBUG" = no; # Debugging for csd_lock_wait(), called from smp_call_function*()
  ### Kernel hacking: end of Lock Debugging (spinlocks, mutexes, etc...)

  "STACKTRACE" = no; # Stack backtrace support
  "WARN_ALL_UNSEEDED_RANDOM" = no; # Warn for all uses of unseeded randomness
  "DEBUG_KOBJECT" = no; # kobject debugging

  ### Kernel hacking -> Debug kernel data structures
  "DEBUG_LIST" = no; # Debug linked list manipulation
  "DEBUG_PLIST" = no; # Debug priority linked list manipulation
  "DEBUG_SG" = no; # Debug SG table operations
  "DEBUG_NOTIFIERS" = no; # Debug notifier call chains
  "BUG_ON_DATA_CORRUPTION" = no; # Trigger a BUG when data corruption is detected
  ### Kernel hacking: end of Debug kernel data structures

  "DEBUG_CREDENTIALS" = no; # Debug credential management

  ### Kernel hacking -> RCU Debugging
  "RCU_SCALE_TEST" = no; # performance tests for RCU
  "RCU_TORTURE_TEST" = no; # torture tests for RCU
  "RCU_REF_SCALE_TEST" = no; # Scalability tests for read-side synchronization (RCU and others)
  "RCU_CPU_STALL_TIMEOUT" = freeform "21"; # RCU CPU stall timeout in seconds
  "RCU_TRACE" = yes; # Enable tracing for RCU
  "RCU_EQS_DEBUG" = no; # Provide debugging asserts for adding NO_HZ support to an arch
  ### Kernel hacking: end of RCU Debugging

  "DEBUG_WQ_FORCE_RR_CPU" = no; # Force round-robin CPU selection for unbound work items
  "DEBUG_BLOCK_EXT_DEVT" = no; # Force extended block device numbers and spread them
  "LATENCYTOP" = no; # Latency measuring infrastructure
  "FTRACE" = no; # Tracers
  "SAMPLES" = no; # Sample kernel code

  ### Kernel hacking -> Kernel Testing and Coverage
  "KUNIT" = no; # KUnit - Enable support for unit tests
  "NOTIFIER_ERROR_INJECTION" = no; # Notifier error injection
  "FAULT_INJECTION" = no; # Fault-injection framework
  "KCOV" = no; # Code coverage for fuzzing
  "RUNTIME_TESTING_MENU" = no; # Runtime Testing
  "MEMTEST" = no; # Memtest
  ### Kernel hacking: end of Kernel Testing and Coverage
  ## end of Kernel hacking
  # end of Linux/riscv 5.10.4 Kernel Configuration
}
