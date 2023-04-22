default:
	mkdir -p "$HOME/Library/Application Support/factorio/mods/actual-evolution_0.1.0/"
	cp -r src/* "$HOME/Library/Application Support/factorio/mods/actual-evolution_0.1.0/"
zip:
	zip actual-evolution_0.1.0.zip src/*
	mv actual-evolution_0.1.0.zip "$HOME/Library/Application Support/factorio/mods/"

clean:
	rm -rf actual-evolution_*.zip

