# == Class: jekyll

class jekyll(
  $base_path = '/var/www'
) {
  file { $base_path:
    ensure => 'directory',
  }

  package { 'rubygems':
    ensure => 'present',
  }

  package { 'jekyll':
    ensure   => 'present',
    provider => 'gem',
  }
}
