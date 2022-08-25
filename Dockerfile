FROM docker.io/golang:1.18-alpine
COPY . /app
WORKDIR /app
RUN CGO_ENABLED=0 go build -ldflags '-s' -o greeter main.go

FROM scratch
WORKDIR /greeter
COPY --from=0 /app/. /greeter/
#EXPOSE 80 8080
ENTRYPOINT [ "/greeter/greeter"]