#!/bin/bash

# make sure  <initializers security="client" transactions="spec"/> has security=client
./bin/standalone.sh -c standalone-full.xml -Djboss.server.base.dir=standalone -Djboss.node.name=node1 
