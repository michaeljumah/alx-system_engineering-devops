# File: nginx_setup.pp

# Install Nginx package
package { 'nginx':
  ensure => 'installed',
  }

# Configure Nginx
file { '/etc/nginx/sites-available/default':
  ensure  => file,
    content => "
server {
  listen 80;
  server_name localhost;

  location / {
    root   /var/www/html;
    index  index.html;
    add_header Content-Type text/html;
    return 200 'Hello World!';
  }

  location /redirect_me {
    return 301 http://example.com/new_location;
  }
}
",
  notify => Service['nginx'],
  }

# Create the HTML directory
file { '/var/www/html':
  ensure => directory,
  }

# Notify Nginx service to restart when the configuration changes
service { 'nginx':
	ensure    => 'running',
	enable    => true,
      	hasstatus => true,
        hasrestart => true,
	}
	