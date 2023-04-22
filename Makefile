default:
	zip actual-evolution_0.1.0.zip src/*
	mv actual-evolution_0.1.0.zip "/Users/brk/Library/Application Support/factorio/mods/"

clean:
	rm -rf actual-evolution_*.zip

