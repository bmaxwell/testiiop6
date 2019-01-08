#!/bin/bash

#./bin/standalone.sh -c standalone-full.xml -Djboss.server.base.dir=standalone -Djboss.node.name=node1 -Djboss.socket.binding.port-offset=100 -Djava.security.policy=test/java.policy -Djava.security.auth.login.config=test/appclientlogin.conf -Dcom.sun.CORBA.ORBUseDynamicStub=true -Dorg.omg.PortableInterceptor.ORBInitializerClass.org.wildfly.iiop.openjdk.csiv2.SASClientInitializer

# does not work
#./bin/standalone.sh -c standalone-full.xml -Djboss.server.base.dir=standalone2 -Djboss.node.name=node2 -Djboss.socket.binding.port-offset=100 

# works
./bin/standalone.sh -c standalone-full.xml -Djboss.server.base.dir=standalone2 -Djboss.node.name=node2 -Djboss.socket.binding.port-offset=100 -Dorg.omg.PortableInterceptor.ORBInitializerClass.org.wildfly.iiop.openjdk.csiv2.SASClientInitializer
