default:
	$(MAKE) build && $(MAKE) run

run:
	docker run -p 4000:4000 --rm -it plug

build:
	docker build --rm -t plug .
