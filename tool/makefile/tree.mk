.PHONY: tree tree-all tree-content tree-structure tree-count


SCRIPT_PATH := ".vscode/generate-directory-tree.sh"

tree: tree-all

tree-all:
	@bash $(SCRIPT_PATH) all

tree-count:
	@bash $(SCRIPT_PATH) count

tree-content:
	@bash $(SCRIPT_PATH) content

tree-structure:
	@bash $(SCRIPT_PATH) structure
