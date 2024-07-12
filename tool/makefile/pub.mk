.PHONY: version doctor clean get fluttergen l10n gen-all gen-watch gen-build upgrade upgrade-major outdated dependencies format analyze check

# Check flutter version
version:
	$(FLUTTER) --version

# Check flutter doctor
doctor:
	$(FLUTTER) doctor

# Clean all generated files
clean:
	rm -rf coverage .dart_tool .packages pubspec.lock
	(rm -rf coverage .dart_tool .packages pubspec.lock)

# Get dependencies
get:
	$(FLUTTER) pub get

# Generate assets
fluttergen:
	dart pub global activate flutter_gen
	fluttergen -c pubspec.yaml

# Generate localization
l10n:
	dart pub global activate intl_utils
	(dart pub global run intl_utils:generate)
	(flutter gen-l10n --arb-dir lib/src/common/localization --output-dir lib/src/common/localization/generated --template-arb-file intl_en.arb)

# Build runner
gen-build:
	$(DART) run build_runner build --delete-conflicting-outputs --release

gen-watch:
	$(DART) run build_runner watch --delete-conflicting-outputs --release


fix: format
	$(DART) fix --apply lib

# Generate all
gen-all: get fluttergen l10n gen-build format

# Upgrade dependencies
upgrade:
	$(FLUTTER) pub upgrade

# Upgrade to major versions
upgrade-major:
	$(FLUTTER) pub upgrade --major-versions

# Check outdated dependencies
outdated: get
	$(FLUTTER) pub outdated

# Check outdated dependencies
dependencies: upgrade
	$(FLUTTER) pub outdated --dependency-overrides \
		--dev-dependencies --prereleases --show-all --transitive

# Format code
format:
	$(DART) format --fix -l 120 .


# Analyze code
analyze: get format
	$(DART)analyze --fatal-infos --fatal-warnings

# Check code
check: analyze
	$(DART) pub publish --dry-run
	$(DART) pub global activate pana
	pana --json --no-warning --line-length 80 > log.pana.json

# Publish package
publish:
	$(DART) pub publish
