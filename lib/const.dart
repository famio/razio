enum HeaderKey {
  authtoken('X-Radiko-Authtoken'),
  ;

  const HeaderKey(this.value);

  final String value;
}
