dummy:
	# build minijail
	docker build -t minijail - < Dockerfile.build.minijail
	docker rm minijail 2>/dev/null || true
	docker create --rm --name minijail minijail
	docker cp minijail:/minijail/minijail0 minijail0
	docker cp minijail:/minijail/libminijailpreload.so libminijailpreload.so
	docker rm minijail
	chmod +x minijail0

	# demo app
	docker build -t app .
	docker rm app 2>/dev/null || true
	echo "docker run --rm --name app app"
