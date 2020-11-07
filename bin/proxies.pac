function FindProxyForURL (url, host) {
  if (dnsDomainIs(host, ".home")) {
    return "SOCKS5 localhost:3128";
  }
  if (dnsDomainIs(host, ".akod.loc")) {
    return "SOCKS5 localhost:31281";
  }

  return "DIRECT";
}
