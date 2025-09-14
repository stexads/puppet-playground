class nodes::stefano (
  String $version = '0.0.1'
) {

  # For use with hieradata
  #include geoipupdate

  # For module version >= 0.9.5
  class { 'geoipupdate':
    package_ensure     => 'present',
    account_id         => 'test',
    license_key        => 'test',
    edition_ids        => 'GeoIP2-Country GeoIP2-City GeoIP2-ISP GeoIP2-Connection-Type',
    conf_dir           => '/etc',
    timer_oncalendar   => '*:*:00/30',
  }

}
