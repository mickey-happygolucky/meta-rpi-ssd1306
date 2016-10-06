# Summary

meta-rpi-ssd1306 support to work with [SSD1306 OLED display(128x64)](https://www.amazon.co.jp/dp/B00XDY2SR8/ref=pd_lpo_sbs_dp_ss_2?pf_rd_p=187205609&pf_rd_s=lpo-top-stripe&pf_rd_t=201&pf_rd_i=B01CXX2JT6&pf_rd_m=AN1VRQENFRJN5&pf_rd_r=YBE0K730416CJPQYB36G) 4pin I2C.

## Dependency

This layer depends on meta-raspberrypi(master branch K4.4)

# How to use

In order to use SSD1306 OLED display(128x64), add the line as follows to your local.conf

```txt
ENABLE_I2C = "1"
KERNEL_DEVICETREE_append = " overlays/ssd1306fb.dtbo"
```

And add to bblayers.conf.
Easy way is run bitbake-layers command such as follows:

```txt
bitbake-layers add-layer ../poky/meta-rpi-ssd1306
```

When this layer added, then created framebuffer device such as `/dev/fb1` on your image.

If you want to use display as console, add the line as follows to your local.conf.

```txt
OLED_CONSOLE = "1"
```
