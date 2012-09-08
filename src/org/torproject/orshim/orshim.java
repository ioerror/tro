// Are you looking for an easy way to shove all your traffic through Tor?
//
// This will set JVM wide SOCKS proxy - automatic shim through Tor:
// java -DsocksProxyHost=127.0.0.1 -DsocksProxyPort=9050
//
// The purpose of OrShim is to provide a way to integrate Tor into any
// application. OrShim checks to ensure the JVM is compatable with this
// technique, it ensures that Tor is running and working as expected, and if it
// is, it sets a JVM wide SOCKS proxy. Callers may provide the ProxyHost
// (Default: 127.0.0.1), a ProxyPort (Default: 9050), to enable or disable (Default:
// On) Tor usage at run time, and in the future, a URL that when fetched
// provides an external view of which IP address is the Tor exit node and that
// Tor circuit building is functional.
//

package org.torproject.orshim;

public class OrShim
{
  private static final String DEFAULT_TOR_HOST = "127.0.0.1";
  private static final int DEFAULT_TOR_PORT = 9050;

  public OrShim()
  {
    OrShim(DEFAULT_TOR_HOST, DEFAULT_TOR_POR);
  }

  public OrShim(String ProxyHost, int ProxyPort)
  {
    OrShim(ProxyHost, ProxyPort);
    init();
  }

  private void init()
  {
    if ( checkJVMSafe() )
    {
      if ( checkTorIsRunning() )
      {
        setJVMWideProxy(ProxyHost, ProxyPort);
      }
    }
  }

  public boolean checkJVMSafe()
  {
    // XXX TODO: list of tested and safe jvms goes here
    // XXX TODO: Match our JVM against it 
    return true;
  }

  public boolean checkTorIsRunning(ProxyHost, ProxyPort)
  {
    // XXX TODO: check that Tor is running by connecting to ProxyHost,
    // ProxyPort and speaking SOCKS5 to it.
    return true;
  }

  private void setJVMWideProxy(ProxyHost, ProxyPort)
  {
    System.setProperty(socksProxyHost=ProxyHost);
    System.setProperty(socksProxyPort=ProxyPort);
  }

  public boolean launchTor()
  {
   // XXX TODO: Implement some kind of JNI stuff with an embedded Tor binary
   // and launch it with an embedded torrc file.
   return False;
  }

  // XXX TODO: We need to provide interfaces to every leaky DNS function and
  // basically, we should try to perform the same tasks as Torsocks if
  // possible.
  public String gethostbyname(string)
  {
    // XXX TODO: We should provide a way to resolve DNS names here
    return "127.0.0.1";
  }
}
