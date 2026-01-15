# PivApplet Makefile

JC_HOME ?= ~/tools/java_card_devkit_tools-bin-v25.1-b_611-26-OCT-2025
GP = java -jar ~/tools/gp/gp.jar

PACKAGE_AID = A000000308000010
CAP_FILE = bin/PivApplet.cap

.PHONY: build install delete update clean

build:
	JC_HOME=$(JC_HOME) ant -f build.xml

install: build
	$(GP) --install $(CAP_FILE)

delete:
	$(GP) --delete $(PACKAGE_AID) --force

update: delete install

clean:
	ant -f build.xml clean
