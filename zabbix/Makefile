#
MINOR=1
SUBDIRS = zabbix_common zabbix_server zabbix_proxy zabbix_fe zabbix_java_gateway

.PHONY: subdirs $(SUBDIRS)

subdirs: $(SUBDIRS)

$(SUBDIRS): zabbix_common
	$(MAKE) -C $@

clean: 
	@for dir in $(SUBDIRS); do \
		$(MAKE) -C $$dir $@ ; \
		$(RM) $$dir/.image ; \
	done

push: subdirs
	@for dir in $(SUBDIRS); do \
		$(MAKE) -C $$dir $@ ; \
	done
