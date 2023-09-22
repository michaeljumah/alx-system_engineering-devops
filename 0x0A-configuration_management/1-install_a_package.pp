# Install flask from pip3 using Puppet

exec { 'puppet-lint':
  command => '/bin/gem install puppet-lint -v 2.5.0',
}
