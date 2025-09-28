![buttfinity1](https://github.com/user-attachments/assets/7be77395-7d78-468e-be83-d2ecec9adc5f)

# Buttfinity

![buttfinity2](https://github.com/user-attachments/assets/d5923fe3-c8ad-45be-b2aa-9161dcbe902f)

Modular, customizable buttons (and other controls) in a gridfinity layout, allowing you to:

- control your computer (as a "fake" keyboard, either as a BLE keyboard using a ESP32 or as HID usb device using a RP2040 (no tutorial yet for that))
- control your smart home (using a ESP8266 or ESP32)
- use as a MIDI controller (using a RP2040, no tutorial yet for that either)
- anything else you can think of

> [!IMPORTANT]  
> Work in progress. Don't expect everything to work perfectly yet.

> [!NOTE]  
> No programming necessary, some soldering is required.  

## How to use

> [!NOTE]  
> This documentation is for the ESP32 or ESP8266 version only, there is no tutorial for the RP2040 version yet.

1. Get the parts if you don't have them yet, see [Hardware Guide](Hardware.md)
2. 3D print the bins and lids, see [3D Printing](docs/3d-printing.md)
2. Install ESPHome, see [ESPHome Guide](docs/install-esphome.md)
3. Either:
	- turn your Buttfinity into a BLE keyboard, see [Using as BLE Keyboard](docs/using-as-ble-keyboard.md)
	- or add buttons to your Home Assistant, see [Add Buttons to Home Assistant](docs/add-buttons-to-homeassistant.md)

## Creating your own lids/bins

[Creating your own lids/bins](docs/creating-your-own-lids-bins.md).

## Credits

- [Gridfinity](https://gridfinity.xyz/) by [Zack Freedman](https://www.youtube.com/@ZackFreedman)
- [Anylid](https://makerworld.com/en/models/1059434-anylid-click-lock-stackable-lid-for-gridfinity) by [rngcntr](https://makerworld.com/en/@rngcntr) for the clickable lids
- [gridfinity-rebuilt-openscad](https://github.com/kennetek/gridfinity-rebuilt-openscad) by [kennetek](https://github.com/kennetek) for the baseplates and bins in openscad
- [Cherry MX switch](https://www.thingiverse.com/thing:5760008) by [neon_c](https://www.thingiverse.com/neon_c/designs)
- [BOSL2](https://github.com/BelfrySCAD/BOSL2) library

Built with:

- [OpenSCAD](https://openscad.org/)
- [Home Assistant](https://www.home-assistant.io/)
- [ESPHome](https://esphome.io/)
- [esphome-blekeyboard](https://github.com/dmamontov/esphome-blekeyboard)

## License

Everything in this repository (excluding everything from the credits section) is licensed under the [CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/) license.
