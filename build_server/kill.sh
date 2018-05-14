#!/bin/bash

PID=$(ps -aef | grep '/home/centos/self-service/build_server/dockerfile.py' | grep -v grep | awk '{print $2}')

kill -9 "$PID"

