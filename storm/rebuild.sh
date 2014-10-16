#!/bin/bash

docker build -t="qburstdevops/storm" storm
docker build -t="qburstdevops/storm-nimbus" storm-nimbus
docker build -t="qburstdevops/storm-supervisor" storm-supervisor
docker build -t="qburstdevops/storm-ui" storm-ui
