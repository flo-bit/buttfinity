# Installing ESPHome

> [!NOTE]  
> If you don't have Home Assistant and just want to use Buttfinity as a BLE keyboard, instead of step 1, follow [the instructions here](./installing-without-homeassistant.md). 


1. Add ESPHome to your Home Assistant by clicking [this link](https://my.home-assistant.io/redirect/supervisor_addon/?addon=5c53de3b_esphome&repository_url=https%3A%2F%2Fgithub.com%2Fesphome%2Fhome-assistant-addon) and clicking "Install". 

Then in ESPHome Device Builder:

2. Click "New Device"

3. Click "Continue"

4. Enter a name for your device and enter your Wifi name and password.

5. Select "ESP32" or "ESP8266" as the board (depending on your microcontroller)

6. Click "Skip" when asked to install to your device.

7. A new device should appear in the list, click "Edit" and you should see the config for your device.

8. If you have an ESP32, change line 5-8 to:

```yaml
esp32:
  board: wemos_d1_mini32
  framework:
    type: arduino
```

If you have an ESP8266, change line 5-6 to:

```yaml
esp8266:
  board: d1_mini
```

9. Click "Install" in the top right corner and select "Manual Download".

10. Wait a few minutes until it's done compiling, then select "Factory Format (Previously Modern)" as the version you want to download.

11. Open [ESPHome Web](https://web.esphome.io/) and click "Add Device" in the top right corner, connect your microcontroller to your computer, click "Connect", select your device.

12. Click "Install" and add the project you downloaded from the ESPHome Device Builder and wait until it's done installing.

13. From now on you can flash you microcontroller wirelessly in the ESPHome Device Builder, you can either [add buttons to connect to Home Assistant](./add-buttons-to-homeassistant.md) there or [use it as a BLE keyboard](./using-as-ble-keyboard.md)