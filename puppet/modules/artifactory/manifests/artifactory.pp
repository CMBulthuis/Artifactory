class artifactory::artifactory {
  class { '::ntp':
      servers => [ '0.pool.ntp.org', '1.pool.ntp.org', '2.pool.ntp.org' ],
  }
  exec {'/bin/yum install -y java-1.8.0-openjdk.x86_64':}
  file { "/etc/yum.repos.d/bintray-jfrog-artifactory-pro-rpms.repo":
    ensure => present,
    source => 'puppet:///modules/artifactory/bintray-jfrog-artifactory-pro-rpms.repo',
  }
  exec {'/bin/yum install -y jfrog-artifactory-pro':}
  file { "/var/opt/jfrog/artifactory/etc/artifactory.lic":
    ensure => present,
    source => 'puppet:///modules/artifactory/artifactory.lic',
  }
  exec {'/sbin/service artifactory start':}
}
