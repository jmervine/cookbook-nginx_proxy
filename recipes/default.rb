include_recipe 'nginx'

bash "ensure sites-enabled" do
  user "root"
  cwd "/etc/nginx"
  code <<-EOH
    test -d sites-enabled || mkdir sites-enabled
  EOH
end

template "/etc/nginx/sites-enabled/#{node['nginx']['app_name']}.conf" do
  source "rails.nginx.erb"
  mode 0664
  owner "root"
  group "root"
  variables({
    :client_max_body_size => node['nginx']['client_max_body_size'],
    :keepalive_timeout => node['nginx']['keepalive_timeout'],
    :listen => node['nginx']['rails']['location_listen'],
    :location => node['nginx']['rails']['location']
  })
end

bash "ensure #{node['nginx']['app_name']}.conf enabled" do
  user "root"
  cwd "/etc/nginx"
  code <<-EOH
    if test -d conf.d; then
      ln -s sites-enabled/#{node['nginx']['app_name']}.conf
    else
      ln -s sites-enabled conf.d
    fi
  EOH
end
