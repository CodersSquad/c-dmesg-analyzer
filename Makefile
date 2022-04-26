# build & test automation

APP_NAME=dmesg-analyzer
LOCAL_DMESG_TXT=dmesg.txt

build:
	gcc ${APP_NAME}.c -o ${APP_NAME}
test: build
	@echo Test 1
	./${APP_NAME} -input ${LOCAL_DMESG_TXT} -output dmesg_report.txt ; echo "status: $$?"
	@echo Test 2
	./${APP_NAME} -input /var/log/dmesg -output current_dmesg_report.txt ; echo "status: $$?"
	@echo Test 3
	./${APP_NAME} ; echo "status: $$?"
	make clean
clean:
	rm -rf ${APP_NAME}
