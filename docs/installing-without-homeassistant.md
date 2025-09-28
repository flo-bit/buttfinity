# Installing ESPHome without Home Assistant

If you don't have Home Assistant you can still use Buttfinity to control your computer (as a "fake" BLE keyboard).

> [!IMPORTANT]  
> This only works with a ESP32 D1 Mini, ESP8266 does not work as a BLE keyboard.

1. Install [ESPHome Device Builder](https://esphome.io/guides/getting_started_command_line/#esphome-device-builder-docker) by:

- Installing [Docker](https://docs.docker.com/get-started/get-docker/) if you don't have it yet

- Running `ESPHome Device Builder` in a terminal:

if you have a mac run:
```bash
# MacOs
docker run --rm -p 6052:6052 -e ESPHOME_DASHBOARD_USE_PING=true -v "${PWD}":/config -it ghcr.io/esphome/esphome
```

otherwise run:
```bash
# On Docker, host networking mode is required for online status indicators
docker run --rm --net=host -v "${PWD}":/config -it ghcr.io/esphome/esphome
```

2. Open [`localhost:6052`](http://localhost:6052) in your browser and you should see the ESPHome dashboard.

Next follow the instructions to [install ESPHome](./install-esphome-on-esp.md) on your ESP32 D1 Mini, then the instructions to [simulate a BLE keyboard](./using-as-ble-keyboard.md).