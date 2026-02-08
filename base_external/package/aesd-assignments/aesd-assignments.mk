AESD_ASSIGNMENTS_VERSION = main
AESD_ASSIGNMENTS_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-shrutikalyankar.git
AESD_ASSIGNMENTS_SITE_METHOD = git

define AESD_ASSIGNMENTS_BUILD_CMDS
	$(MAKE) CC=$(TARGET_CC) -C $(@D)/finder-app
endef

define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/finder-app/writer $(TARGET_DIR)/usr/bin/writer
	$(INSTALL) -m 0755 $(@D)/finder-app/finder.sh $(TARGET_DIR)/usr/bin/finder.sh
	$(INSTALL) -m 0755 $(@D)/finder-app/finder-test.sh $(TARGET_DIR)/usr/bin/finder-test.sh
	$(INSTALL) -m 0755 $(@D)/finder-app/tester.sh $(TARGET_DIR)/usr/bin/tester.sh

	mkdir -p $(TARGET_DIR)/etc/finder-app/conf
	cp -r $(@D)/finder-app/conf/* $(TARGET_DIR)/etc/finder-app/conf/
endef

$(eval $(generic-package))
