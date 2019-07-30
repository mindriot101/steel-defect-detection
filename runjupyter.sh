#!/bin/sh

set -e

cd /workspace
jupyter lab --port 8888 --ip 0.0.0.0 --no-browser
