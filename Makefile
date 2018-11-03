build:
	docker build -t try-go-codepipeline .
build-eb:
	-make clean
	zip deployment_$(shell date +%s).zip -r * .[^.]* --exclude \*.git\*
clean:
	rm deployment_*.zip
run:
	make build
	clear
	docker run -p 8091:8091 try-go-codepipeline
