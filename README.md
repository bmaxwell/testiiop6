# testiiop6
Jacob EJB sample with security

# Add the test user
$JBOSS_HOME/bin/add-user.sh -a -u ejbuser -p redhat1! -g ejbtest

# Deploy
cp target/testiiop.jar $JBOSS_HOME/standalone/deployments/

# Create a copy of the standalone dir
cp -R standalone/ standalone2/

# Start 2 JBoss instances
start1.sh and start2.sh

# To run the client
-Djava.security.policy=/path/java.policy -Djava.security.auth.login.config=/path/appclientlogin.conf -Dcom.sun.CORBA.ORBUseDynamicStub=true -Dorg.omg.CORBA.ORBClass=org.jacorb.orb.ORB -Dorg.omg.CORBA.ORBSingletonClass=org.jacorb.orb.ORBSingleton -Dorg.omg.PortableInterceptor.ORBInitializerClass.org.jboss.as.jacorb.csiv2.SASClientInitializer

Use one of the run scripts which will point to the jars needed for the client classpath:

run-7.1.5.sh /path/to/jboss-eap-7.1.5/

run-6.2.21.sh /path/to/jboss-eap-6.4.21/
