include_recipe 'nginx'

bash "ensure sites-enabled" do
  user "root"
  cwd "/etc/nginx"
  code <<-EOH
    test -d sites-enabled || mkdir sites-enabled
  EOH
end

template "/etc/nginx/sites-enabled/#{node['nginx']['app_name']}.conf" do
  source "proxy.conf.erb"
  mode 0664
  owner "root"
  group "root"
  variables({
    :client_max_body_size => node['nginx']['client_max_body_size'],
    :keepalive_timeout    => node['nginx']['keepalive_timeout'],
    :listen               => node['nginx']['proxy']['listen'],
    :location             => node['nginx']['proxy']['location'],
    :server_name          => node['nginx']['proxy']['server_name']
  })
end

bash "ensure #{node['nginx']['app_name']}.conf enabled" do
  user "root"
  cwd "/etc/nginx"
  code <<-EOH
    if test -d conf.d; then
      test -L conf.d/#{node['nginx']['app_name']}.conf || \
        ln -s sites-enabled/#{node['nginx']['app_name']}.conf conf.d/#{node['nginx']['app_name']}.conf
    else
      test -L conf.d || \
        ln -s sites-enabled conf.d
    fi
  EOH
end
