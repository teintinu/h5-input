#
# My Fancy Node.js project
#
 
PROJECT = "My Fancy Node.js project"
 
 
all: webpack gi
 
debug: ;@echo "Debugging ${PROJECT}.....http://0.0.0.0:8080/debug?port=5858 to start debugging"; \
	export NODE_PATH=.; \
	node-inspector & coffee --nodejs --debug app.coffee;
 
test: ;@echo "Testing ${PROJECT}....."; \
	export NODE_PATH=.; \
	./node_modules/mocha/bin/mocha;
 
server : ;@echo "Starting ${PROJECT}....."; \
	export NODE_PATH=.; \
	coffee app.coffee
 net
install: ;@echo "Installing ${PROJECT}....."; \
	npm install
 
update: ;@echo "Updating ${PROJECT}....."; \
	git pull --rebase; \
	npm install
 
clean : ;
	rm -rf node_modules
 
 
watch:
    while true; do \
        make $(WATCHMAKE); \
        inotifywait -qre close_write .; \
    done
    
.PHONY: test server install clean update watch
    