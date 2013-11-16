# == Class: jekyll

class jekyll(
  $base_path = undef
) {
  include jekyll::params

  if $base_path == undef {
    $base_path = $jekyll::params::base_path
  }

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
