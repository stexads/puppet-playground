class nodes::stefano (
  String $version = '0.0.1'
) {

#  include geoipupdate

  class { 'geoipupdate':
    account_id         => 'test',
    license_key        => 'test',
    edition_ids        => 'GeoIP2-Country GeoIP2-City GeoIP2-ISP GeoIP2-Connection-Type',
    package_ensure     => 'present',
    package_name       => 'geoipupdate',
    service_update_cmd => '/usr/bin/dnf -y update geoipupdate',
    timer_oncalendar   => 'Mon-Fri *:*:00',
  }

}
