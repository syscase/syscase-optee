#ifndef __STD_SMC_H__
#define __STD_SMC_H__

#define ARM_STD_SVC_CALL_COUNT		0x8400ff00
#define ARM_STD_SVC_UID			0x8400ff01
/*                                      0x8400ff02 is reserved */
#define ARM_STD_SVC_VERSION		0x8400ff03

/* ARM Standard Service Calls version numbers */
#define STD_SVC_VERSION_MAJOR		0x0
#define STD_SVC_VERSION_MINOR		0x1

/* The macros below are used to identify PSCI calls from the SMC function ID */
#define PSCI_FID_MASK			0xffe0u
#define PSCI_FID_VALUE			0u
#endif
