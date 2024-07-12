.PHONY: tree tree-all tree-content tree-structure tree-count


SCRIPT_PATH := ".vscode/generate-directory-tree.sh"

tree: tree-all

tree-all:
	@sh $(SCRIPT_PATH) all

tree-count:
	@sh $(SCRIPT_PATH) count

tree-content:
	@sh $(SCRIPT_PATH) content

tree-structure:
	@sh $(SCRIPT_PATH) structure

