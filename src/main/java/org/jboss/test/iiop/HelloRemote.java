package org.jboss.test.iiop;

import java.rmi.RemoteException;

import javax.ejb.EJBObject;

public interface HelloRemote extends EJBObject
{
   String hello(String message) throws RemoteException;
   String hello2(String message, String host, int port) throws RemoteException;
}
