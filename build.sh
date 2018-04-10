#!/bin/bash
go build -ldflags '-extldflags "-static" -X github.com/drone/drone/version.VersionDev=build.'${DRONE_BUILD_NUMBER} -o release/drone-server github.com/drone/drone/cmd/drone-server
GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -ldflags '-X github.com/drone/drone/version.VersionDev=build.'${DRONE_BUILD_NUMBER} -o release/drone-agent github.com/drone/drone/cmd/drone-agent
docker build -t terpro/drone .
docker build -t terpro/drone-agent -f Dockerfile.agent .
