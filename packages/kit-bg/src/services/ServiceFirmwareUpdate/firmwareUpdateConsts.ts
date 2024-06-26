import type { IDeviceType } from '@onekeyfe/hd-core';

export const FIRMWARE_UPDATE_MIN_VERSION_ALLOWED: Partial<
  Record<
    IDeviceType,
    {
      ble?: string;
      firmware?: string;
      bootloader?: string;
    }
  >
> = {
  'pro': {
    // firmware: '0.0.0',
    // ble: '0.0.0',
    // bootloader: '0.0.0',
  },
  'touch': {
    // >= 4.1.0 allowed update by App, < 4.1.0 only allowed update by web
    firmware: '4.1.0', // only 4.1.0 support bootloader update
    // ble: '0.0.0',
    bootloader: '2.4.2',
  },
  'classic': {
    firmware: '3.0.0',
    // ble: '0.0.0',
    bootloader: '2.0.0',
  },
  'classic1s': {
    firmware: '3.0.0',
    // ble: '0.0.0',
    bootloader: '2.0.0',
  },
  'mini': {
    firmware: '3.0.0',
    // ble: '0.0.0',
    bootloader: '2.0.0',
  },
};

const batteryLevelMap = {
  '25%': 1,
  '50%': 2,
  '75%': 3,
  '100%': 4,
};
export const FIRMWARE_UPDATE_MIN_BATTERY_LEVEL = batteryLevelMap['25%'];
