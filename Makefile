MYDIR = ./docs/examples

compile-examples: $(MYDIR)/*
	for file in $^ ; do \
		echo $${file} && cd $${file} && spago bundle-app && cd ../../../ && pwd;\
	done