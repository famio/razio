enum HeaderKey {
  authtoken('X-Radiko-Authtoken'),
  areaId('X-Radiko-AreaId'),
  ;

  const HeaderKey(this.value);

  final String value;
}
