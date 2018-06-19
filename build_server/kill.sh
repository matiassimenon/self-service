#!/bin/bash

PID=$(ps -aef | grep dockerfile.py | grep -v grep | awk '{print $2}')

kill -9 "$PID"

