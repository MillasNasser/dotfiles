all:
	@echo "Dotfile helper (Created by Millas Nasser)"
	@echo ""
	@echo "If there is any error you have to grant the right permissions to all"
	@echo "script files (use make grant)"
	@echo ""
	@echo "List all files do you want to install the update into target.txt in"
	@echo "script/target.txt. All files must be located into home folder"
	@echo ""
	@echo "After all configurations use make install to install an automatic"
	@echo "update."

grant:
	@chmod +x script/install.sh
	@chmod +x script/remove.sh
	@chmod +x script/update.sh

install: remove
	@./script/install.sh

remove:
	@./script/remove.sh
