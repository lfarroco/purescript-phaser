MYDIR = ./docs/examples

compile-examples: $(MYDIR)/*
	for file in $^ ; do \
		echo $${file} && cd $${file} && spago bundle-app && cd ../../../ && pwd;\
	done

compile-ffi-bindings:
	# npx lfarroco/oop-ffi --path ./specs/Phaser/Scene.json --output ./specs/generated/Phaser/
	# npx lfarroco/oop-ffi --path ./specs/Phaser/Events/EventEmitter.json --output ./specs/generated/Phaser/Events/
	# npx lfarroco/oop-ffi --path ./specs/Phaser/GameObjects/GameObject.json --output ./specs/generated/Phaser/GameObjects/
	npx lfarroco/oop-ffi --path ./specs/Phaser/Game.json --output ./specs/generated/Phaser/