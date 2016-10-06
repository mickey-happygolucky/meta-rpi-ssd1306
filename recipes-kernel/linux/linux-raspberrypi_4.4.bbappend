FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.4:"

SRC_URI += "file://0001-fbdev-ssd1307fb-Start-to-use-gpiod-API-for-reset-gpi.patch \
			file://0002-fbdev-ssd1307fb-Remove-reset-active-low-from-the-DT-.patch \
			file://0003-fbdev-ssd1307fb-Make-reset-gpio-devicetree-property-.patch \
			file://0004-fbdev-ssd1307fb-Fix-a-chargepump-problem-for-SSD1306.patch \
			file://0005-fbdev-ssd1307fb-Fix-i2c-error-at-initialize.patch \
			file://0006-dts-add-overlay-for-SSD1306.patch \
"

# CMDLINE for raspberrypi with pitft
CMDLINE_PITFT = "dwc_otg.lpm_enable=0 console=serial0,115200 root=/dev/mmcblk0p2 rootfstype=ext4 rootwait debug fbcon=map:1 fbcon=font:VGA8x8"

do_defconfig_oled() {
	echo 'CONFIG_FB_SSD1307=y' >> ${WORKDIR}/defconfig
}

OLED_CONSOLE ?= ""
do_deploy_append() {

	if [ ${OLED_CONSOLE} = "1" ] ; then
		# Deploy cmdline.txt
		install -d ${DEPLOYDIR}/bcm2835-bootfiles
		echo "${CMDLINE_PITFT}" > ${DEPLOYDIR}/bcm2835-bootfiles/cmdline.txt
	fi
}

addtask defconfig_oled before do_configure after do_kernel_configme
