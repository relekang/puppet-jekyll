# == Class jekyll::nginx
class jekyll::nginx {
  file {"${title}.conf":
    path    => "/etc/nginx/sites-enabled/${title}.conf",
    owner   => root,
    group   => root,
    mode    => '0644',
    content => template("${module_name}/nginx.erb"),
  }
}
