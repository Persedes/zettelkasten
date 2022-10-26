dfrmt := $(shell date +'%Y-%m-%d')
fname := notes/notes_$(dfrmt).md

run:
	docker run --rm -t -i -p 8080:8080 -v `pwd`:/notes sridca/neuron neuron gen -ws 0.0.0.0:8080

diary:
# move over template and insert data as header
ifeq ("$(wildcard $(fname))","")
	cp notes/template.md $(fname)
	sed -i "1s/^/\# $(dfrmt)\n\n/" $(fname)
endif
	~/nvim.appimage $(fname)


.PHONY: run diary

