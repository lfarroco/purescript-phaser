MYDIR = ./docs/examples

compile-examples: $(MYDIR)/*
	for file in $^ ; do \
		echo $${file} && cd $${file} && spago bundle-app && cd ../../../ && pwd;\
	done

compile-ffi-bindins:
	# npx lfarroco/oop-ffi --path ./specs/Phaser/Scene.json --output ./specs/generated/Phaser/
	# npx lfarroco/oop-ffi --path ./specs/Phaser/Events/EventEmitter.json --output ./specs/generated/Phaser/Events/