build:
	docker build -t try-go-codepipeline .
run:
	make build
	clear
	docker run -p 8091:8091 try-go-codepipeline
