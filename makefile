.PHONY: help get clean fluttergen gen-build gen-watch fix format get-mstaffapi-client get-service-desk get-ota-update gen-service-desk gen-all update

# Переменные для использования fvm flutter и fvm dart
FLUTTER = fvm flutter
DART = fvm dart

########################
# Общая помощь
########################

# Задача для получения зависимостей
get:
	$(FLUTTER) pub get


########################
# Очистка
########################

# Задача для очистки предыдущих сборок
clean:
	$(FLUTTER) clean

########################
# Генерация кода
########################

# Задача для сборки с использованием build_runner
gen-build:
	$(DART) run build_runner build --delete-conflicting-outputs --release

# Задача для запуска build_runner в режиме наблюдения
gen-watch:
	$(DART) run build_runner watch --delete-conflicting-outputs --release



########################
# Исправление и форматирование
########################

# Задача для применения исправлений Dart кода
fix:
	$(DART) fix --apply lib

# Задача для форматирования Dart кода
format:
	$(DART) format --fix .

########################
# Комплексные задачи
########################

# Задача для выполнения всех задач генерации
gen-all: clean get gen-build

# Задача для получения всех зависимостей
get-all: clean get 


build-web:
	$(FLUTTER) build web --release --dart-define-from-file=config/production.json


SCRIPT_PATH := ".vscode/scripts/generate-directory-tree.sh"

tree: tree-all

tree-all:
	@bash $(SCRIPT_PATH) all

tree-count:
	@bash $(SCRIPT_PATH) count

tree-content:
	@bash $(SCRIPT_PATH) content

tree-structure:
	@bash $(SCRIPT_PATH) structure