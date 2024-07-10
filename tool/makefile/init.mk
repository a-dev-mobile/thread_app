.PHONY: init init-fvm init-global


init: init-fvm init-global

init-fvm:
	$(FVM) install 3.22.2; $(FVM) use 3.22.2 --force;

init-global:
	$(DART) pub global activate assets_gen;
	$(DART) pub global activate flutter_analyze_reporter;
