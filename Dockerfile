FROM golang:1.11.2-alpine3.8 AS build
WORKDIR /go/src/github.com/riandyrn/try-go-codepipeline
ADD ./main.go .
RUN go build -o app

FROM alpine:3.8
RUN apk add ca-certificates
COPY --from=build /go/src/github.com/riandyrn/try-go-codepipeline/app .
ENTRYPOINT ./app
EXPOSE 8091