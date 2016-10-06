do_deploy_append() {
	echo "dtoverlay=ssd1306fb" >> \
	      ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
}
