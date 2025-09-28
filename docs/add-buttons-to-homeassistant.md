# Adding buttons to Home Assistant

Add buttons or similar to Home Assistant by adding sensors to you ESPHome config (in ESPHome Device Builder click "Edit").

Simple example for a button (you might have to change the pin):

```yaml
binary_sensor:
  - platform: gpio
    pin:
      number: GPIO22
      mode: INPUT_PULLUP
      inverted: true
    name: "Button"
```

In Home Assistant you can then go to "Settings" -> "Devices & Services", where your ESP should appear. Add it and you should see your Button as a sensor. Add automations using that button doing whatever you want it to do.

Other sensors work mostly the same, see [the ESPHome documentation](https://esphome.io/components/) for available sensors.