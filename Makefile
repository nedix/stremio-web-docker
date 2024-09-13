setup:
	@docker build . -t stremio-web --progress=plain

up: port=8080
up:
	@docker run --rm --name stremio-web \
        -p 127.0.0.1:$(port):3000 \
        stremio-web

down:
	-@docker stop stremio-web

shell:
	@docker exec -it stremio-web /bin/sh
