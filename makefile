.PHONY: help

FVM = fvm

ifeq (, $(shell which ${FVM}))
FLUTTER = flutter
DART = dart
else
FLUTTER = $(FVM) flutter
DART = $(FVM) dart
endif



help:
	@echo "Let's make something good"
	@flutter --version

-include tool/makefile/tree.mk tool/makefile/pub.mk tool/makefile/test.mk tool/makefile/setup.mk tool/makefile/deploy.mk tool/makefile/init.mk
