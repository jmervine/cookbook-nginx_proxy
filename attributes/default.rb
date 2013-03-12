default['nginx']['install_method']           = "package"
default['nginx']['user']                     = "root"
default['nginx']['keepalive_timeout']        = "5"
default['nginx']['worker_processes']         = "1"
default['nginx']['default_site_enabled']     = false
default['nginx']['client_max_body_size']     = "4G"
default['nginx']['rails']                    = {}

default['nginx']['rails']['location']['name']              = "/"
default['nginx']['rails']['location']['proxy_set_header']  = [ "X-Forwarded-For $proxy_add_x_forwarded_for;", "Host $http_host;" ]
default['nginx']['rails']['location']['proxy_redirect']    = "off"
default['nginx']['rails']['location']['proxy_pass']        = "http://0.0.0.0:9000"

