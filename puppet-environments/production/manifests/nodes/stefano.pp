class nodes::stefano (
  String $version = '0.0.1'
) {

  # For use with hieradata
  #include geoipupdate

  # For module version >= 0.9.7
  class { 'geoipupdate':
    # Optional parameter package_name defaults to 'geoipupdate'
    package_name       => 'geoipupdate',
    presence_status    => 'present', # Enum [ "present", "absent" ]
    account_id         => 'test',
    license_key        => 'testKey',
    edition_ids        => 'GeoIP2-Country GeoIP2-City GeoIP2-ISP',
    conf_dir           => '/etc',
    target_dir         => '/tmp/geoip',
    timer_oncalendar   => '*-*-* *:00:*',
  }

}
