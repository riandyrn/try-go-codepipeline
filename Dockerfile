# set base image for building the app
FROM golang:1.11.2-alpine3.8 AS build
# set workdir
WORKDIR /go/src/github.com/riandyrn/try-go-codepipeline
# add source code
ADD ./main.go .
# build the app
RUN go build -o app

# set base image for running the app, the reason 
# why we use multiple stage for building & running 
# the app here is because we want to minimize the 
# size of resulted container
FROM alpine:3.8
# install ca-certificates to make container able 
# to access https site, actually we doesn't really
# need this in this project, but if you decided to
# use this project as base to build real project
# you will need this installation
RUN apk add ca-certificates
# copy the app from build stage
COPY --from=build /go/src/github.com/riandyrn/try-go-codepipeline/app .
# execute the app
ENTRYPOINT ./app
# expose port 8091, this the port will be used by
# our app to serve request
EXPOSE 8091