#!/bin/bash

#./bin/standalone.sh -c standalone-full.xml -Djboss.server.base.dir=standalone -Djboss.node.name=node1 -Djava.security.policy=test/java.policy -Djava.security.auth.login.config=test/appclientlogin.conf -Dcom.sun.CORBA.ORBUseDynamicStub=true -Dorg.omg.PortableInterceptor.ORBInitializerClass.org.wildfly.iiop.openjdk.csiv2.SASClientInitializer
./bin/standalone.sh -c standalone-full.xml -Djboss.server.base.dir=standalone -Djboss.node.name=node1 -Dorg.omg.PortableInterceptor.ORBInitializerClass.org.wildfly.iiop.openjdk.csiv2.SASClientInitializer
