# Compile stage
FROM golang AS build-env

WORKDIR /go/src/app

COPY app/ .

RUN go build -o /dist/app

# Final stage
FROM scratch
COPY --from=build-env /dist/app /
ENTRYPOINT ["/app"]