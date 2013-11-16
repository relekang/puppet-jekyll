# == Define jekyll:site

define jekyll::site (
  $domain,
  $repo,
  $ensure = 'present',
  $vcs_type = 'git',
  $site_path = "${jekyll::params::base_path}/${title}"
) {
  include jekyll::nginx

  vcsrepo { $site_path:
    ensure   => $ensure,
    provider => $vcs_type,
    source   => $repo,
  }

  exec { "build-${title}":
    command     => '/sbin/jekyll build',
    cwd         => $site_path,
    subscribe   => Vcsrepo[$site_path],
    refreshonly => true
  }
}
