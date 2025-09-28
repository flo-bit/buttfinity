# Using as a BLE keyboard

> [!IMPORTANT]  
> This only works with the ESP32 version, both ESP8266 and RP2040 are not supported, as they don't have bluetooth.

Turn your Buttfinity module into a BLE keyboard by adding the following to you ESPHome config (in ESPHome Device Builder click "Edit").

```yaml
external_components:
  - source: github://dmamontov/esphome-blekeyboard

ble_keyboard:
  id: my_ble_keyboard
  name: "Buttfinity BLE Keyboard"
  manufacturer_id: "Buttfinity"
  reconnect: true
  battery_level: 50
  buttons: true
```

Now you can add buttons to your Buttfinity that will send keystrokes to your computer like this (you might have to change the pin):

```yaml
# type "hello world" when button is pressed
binary_sensor:
  - platform: gpio
    pin:
      number: GPIO22
      mode: INPUT_PULLUP
      inverted: true
    name: "Button"
    on_press:
      - ble_keyboard.print:
          id: my_ble_keyboard 
          text: "hello world"
```

See [esphome-blekeyboard](https://github.com/dmamontov/esphome-blekeyboard) for more information.