package org.jboss.test.iiop;

import javax.annotation.Resource;
import javax.annotation.security.RolesAllowed;
import javax.annotation.security.RunAs;
import javax.ejb.RemoteHome;
import javax.ejb.SessionContext;
import javax.ejb.Stateless;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;

import java.util.Hashtable;
import org.jboss.ejb3.annotation.SecurityDomain;
import javax.annotation.Resource;

import javax.security.auth.login.LoginContext;
import org.jboss.test.iiop.client.SimpleCallbackHandler;

@Stateless
@RemoteHome(HelloRemoteHome.class)
@SecurityDomain("other")
//@RunAs("ejbuser")
public class HelloSessionBean {

	@Resource
	private SessionContext ctx;

   @RolesAllowed("ejbtest")
   public String hello(String message) {
      String user = (ctx.getCallerPrincipal() == null) ? "null" : ctx.getCallerPrincipal().getName(); 
      String response = "Hello Received: " + message + " from " + user;
			System.out.println(response);
      return "Hello " + user + " " + response; 
   }

   @RolesAllowed("ejbtest")
   public String hello2(String message, String host, int port) {
      String user = (ctx.getCallerPrincipal() == null) ? "null" : ctx.getCallerPrincipal().getName(); 

			try {
/*
      LoginContext loginContext = new LoginContext("csi", new SimpleCallbackHandler("ejbuser", "redhat1!"));
      loginContext.login();
*/


      // get initial context
      InitialContext ctx = new InitialContext(new Hashtable<String,String>());
      String ejbLookupPath = "HelloSessionBean";
      String lookup = "corbaname:iiop:" + host + ":" + port +"#" + ejbLookupPath;
      // lookup the IIOP EJB
      Object iiopObj = ctx.lookup(lookup);
      HelloRemoteHome ejbHome = (HelloRemoteHome) PortableRemoteObject.narrow(iiopObj, HelloRemoteHome.class);
      HelloRemote remote = ejbHome.create();

      String response = "Hello2 Received: " + message + " from " + user;
			System.out.println(response);
      return remote.hello(response);
			} catch(Exception e) {
				return e.getClass().getName() + ": " + e.getMessage();
			}
   }

}
