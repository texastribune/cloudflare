APP=cloudflare
NS=texastribune

build:
	docker build --tag=${NS}/${APP} .

debug:
	docker run --volumes-from=${APP} --interactive=true --tty=true ${NS}/${APP} bash

run:
	docker run --rm --name=${APP} --detach=true ${NS}/${APP}

clean:
	docker stop ${APP} && docker rm ${APP}

interactive:
	docker run --env-file=env --rm --interactive --tty --name=${APP} ${NS}/${APP} bash
