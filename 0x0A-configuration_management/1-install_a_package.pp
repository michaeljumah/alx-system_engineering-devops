#install flask from pip3 using Puppet

# Filename: install_flask.pp

package { 'python3-pip':
  ensure => installed,
}

exec { 'install_flask':
  command     => '/usr/bin/pip3 install Flask==2.1.0',
  path        => ['/usr/bin'],
  require     => Package['python3-pip'],
  logoutput   => true,
  failonfail  => true,
}

# Notify the version after installing Flask
notify { 'flask_version':
  message => '/usr/bin/flask --version',
  require => Exec['install_flask'],
}
