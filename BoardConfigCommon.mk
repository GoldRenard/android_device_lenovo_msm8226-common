#
# Copyright (C) 2013 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

BOARD_VENDOR := lenovo-qcom

# Platform
TARGET_BOARD_PLATFORM_GPU := qcom-adreno305
TARGET_BOARD_PLATFORM := msm8226
TARGET_BOOTLOADER_BOARD_NAME := MSM8226
TARGET_CPU_VARIANT := krait
TARGET_USE_KINGFISHER_OPTIMIZATION := true

-include device/lenovo/qcom-common/BoardConfigCommon.mk

LOCAL_PATH := device/lenovo/msm8226-common

TARGET_SPECIFIC_HEADER_PATH += $(LOCAL_PATH)/include

BOARD_HAS_QCOM_WLAN_SDK :=

WLAN_MODULES:
	mkdir -p $(KERNEL_MODULES_OUT)/pronto
	mv $(KERNEL_MODULES_OUT)/wlan.ko $(KERNEL_MODULES_OUT)/pronto/pronto_wlan.ko
	ln -sf /system/lib/modules/pronto/pronto_wlan.ko $(TARGET_OUT)/lib/modules/wlan.ko

TARGET_KERNEL_MODULES += WLAN_MODULES

# QCOM BSP
TARGET_USES_QCOM_BSP := true
COMMON_GLOBAL_CFLAGS += -DQCOM_BSP

# Audio
AUDIO_FEATURE_DISABLED_FM :=
AUDIO_FEATURE_DISABLED_SSR := true
BOARD_HAVE_QCOM_FM := true
AUDIO_FEATURE_DISABLED_ANC_HEADSET := true
AUDIO_FEATURE_DISABLED_DS1_DOLBY_DDP := true

# GPS
TARGET_NO_RPC := true

# Graphics
BOARD_EGL_CFG := $(LOCAL_PATH)/config/egl.cfg
TARGET_DISPLAY_USE_RETIRE_FENCE :=
TARGET_QCOM_DISPLAY_VARIANT := caf-new

# Enables Adreno RS driver
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so

# Lights
TARGET_PROVIDES_LIBLIGHT := true

TARGET_QCOM_MEDIA_VARIANT := caf-new

# Use qcom power hal
TARGET_POWERHAL_VARIANT := qcom

# Enable CPU boosting events in the power HAL
TARGET_USES_CPU_BOOST_HINT := true

TARGET_HW_DISK_ENCRYPTION := true

# Hardware tunables framework
BOARD_HARDWARE_CLASS := device/lenovo/msm8226-common/cmhw/

# Assert
TARGET_OTA_ASSERT_DEVICE := s856,shellr,shellr_umts,shellr_umtsds,shellr_gpe

# Recovery
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/rootdir/etc/fstab.qcom
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_RECOVERY_SWIPE := true
