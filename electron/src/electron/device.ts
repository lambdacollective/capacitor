import {
  DeviceBatteryInfo,
  DeviceInfo,
  DeviceLanguageCodeResult,
  DevicePlugin,
  DevicePluginWeb,
  WebPlugin
} from "@lambda-capacitor/core";

declare var navigator: any;
const webDevice = new DevicePluginWeb();

export class DevicePluginElectron extends WebPlugin implements DevicePlugin {
  constructor() {
    super({
      name: "Device",
      platforms: ["electron"]
    });
  }

  async getInfo(): Promise<DeviceInfo> {
    var info = await webDevice.getInfo();

    return {
      model: info.model,
      platform: <"electron">"electron",
      appVersion: "",
      appBuild: "",
      operatingSystem: info.operatingSystem,
      osVersion: info.osVersion,
      manufacturer: navigator.vendor,
      isVirtual: false,
      uuid: info.uuid
    };
  }

  async getBatteryInfo(): Promise<DeviceBatteryInfo> {
    var batInfo = await webDevice.getBatteryInfo();

    return {
      batteryLevel: batInfo.batteryLevel,
      isCharging: batInfo.isCharging
    };
  }

  async getLanguageCode(): Promise<DeviceLanguageCodeResult> {
    return webDevice.getLanguageCode();
  }
}

const Device = new DevicePluginElectron();

export { Device };
