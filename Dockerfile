#FROM golang:1.15 as build
#WORKDIR $GOPATH/avalanche
#COPY . .
#RUN GO111MODULE=on CGO_ENABLED=0 GOOS=linux go build -o=/bin/avalanche ./cmd

FROM registry-jinan-lab.inspurcloud.cn/library/os/inspur-alpine-3.10:5.0.0
COPY --from=build /bin/avalanche /bin/avalanche
EXPOSE 9001
ENTRYPOINT ["/bin/avalanche"]
