FROM golang AS builder
ENV GOPROXY=""
ENV GO111MODULE=on
ENV PROJECT_PATH=""
RUN go get -u github.com/swaggo/swag/cmd/swag
WORKDIR /go/src/

ENTRYPOINT cd `dirname ${PROJECT_PATH}` && swag init -g `basename ${PROJECT_PATH}` --parseDependency --parseVendor