.PHONY:	build push

build:
	docker build -t tkuchiki/fvcl-configtest .

push:
	docker push tkuchiki/fvcl-configtest:latest
