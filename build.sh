#!/bin/bash

set -ex

docker buildx build --platform=linux/arm64 --file Dockerfile --tag pegasus/plankifier --progress=plain $@ --push .
