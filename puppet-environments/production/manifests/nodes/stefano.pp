class nodes::stefano (
  String $version = '0.0.1'
) {

  include geoipupdate
#  class { 'geoipupdate':
#    account_id     => "123456",
#    license_key    => "0987654321",
#    edition_ids    => [ "test0", "test1" ],
#    package_ensure => "present",
##    package_ensure => "absent",
#    package_name   => 'geoipupdate',
#  }

}
