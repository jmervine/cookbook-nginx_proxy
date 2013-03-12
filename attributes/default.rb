default['nginx']['install_method']           = "source"
default['nginx']['user']                     = "nginx"
default['nginx']['keepalive_timeout']        = "5"
default['nginx']['worker_processes']         = "1"
default['nginx']['default_site_enabled']     = false
default['nginx']['client_max_body_size']     = "4G"

default['nginx']['app_name']                 = "proxy"

default['nginx']['proxy']['listen']                        = "80"
default['nginx']['proxy']['server_name']                   = "_"
default['nginx']['proxy']['location']['name']              = "/"
default['nginx']['proxy']['location']['proxy_set_header']  = [ "X-Forwarded-For $proxy_add_x_forwarded_for;", "Host $http_host;" ]
default['nginx']['proxy']['location']['proxy_redirect']    = "off"
default['nginx']['proxy']['location']['proxy_pass']        = "http://0.0.0.0:9000"

