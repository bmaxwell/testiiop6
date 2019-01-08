#!/bin/bash

jbossHome=$1
shift
modules="${jbossHome}/modules/system/layers/base"
picketbox=${modules}/org/picketbox/main/picketbox-5.0.3.Final-redhat-3.jar:${modules}/org/picketbox/main/picketbox-commons-1.0.0.final-redhat-5.jar
orb=${modules}/javax/orb/api/main/openjdk-orb-8.0.8.Final-redhat-1.jar:${modules}/org/wildfly/iiop-openjdk/main/wildfly-iiop-openjdk-7.1.5.GA-redhat-00002.jar
client="target/testiiop.jar:${jbossHome}/bin/client/jboss-cli-client.jar:${jbossHome}/bin/client/jboss-client.jar"
orb=${modules}/javax/orb/api/main/openjdk-orb-8.0.8.Final-redhat-1.jar:${modules}/org/wildfly/iiop-openjdk/main/wildfly-iiop-openjdk-7.1.5.GA-redhat-00002.jar

cp="${client}:${picketbox}:${orb}" 

JAVA_OPTS="-Djava.security.policy=$PWD/java.policy -Djava.security.auth.login.config=$PWD/appclientlogin.conf -Dcom.sun.CORBA.ORBUseDynamicStub=true -Dorg.omg.PortableInterceptor.ORBInitializerClass.org.wildfly.iiop.openjdk.csiv2.SASClientInitializer"

echo "java $JAVA_OPTS -cp $cp org.jboss.test.iiop.client.JDKClient $*"

java $JAVA_OPTS -cp $cp org.jboss.test.iiop.client.JDKClient $*
