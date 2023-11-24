# Install flask from pip3 using Puppet

package { 'python3-pip':
 ensure => 'installed,
}

exec {'install_flask':
     command => '/usr/bin/pip3 install Flask==2.1.0',
     path => ['/usr/bin'],
     require => Package[python3-pip'],
}
