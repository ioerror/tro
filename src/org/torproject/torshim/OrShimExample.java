package org.torproject.torshim;
// OrShim example
// Example of how to use OrShim in your Java Program



public class OrShimExample
{
  public static void main(String args[])
  {
    // If you want to set a custom Tor SOCKS host/port - use the following:
    // torify = new OrShim("127.0.0.1", 9050); // Set our own Tor SOCKS host/port
    // If you want to use reasonable defaults - use the following:
    OrShim torify = new OrShim(); // Safe defaults

    // Your application is now routing connections over Tor JVM wide!
    // XXX TODO: Confirm the above is true for your use case with wireshark and
    // a little help from your friends...

    // Do something anonymously here...

  }
}

