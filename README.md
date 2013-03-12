### Example Usage

    // defaults
    {
      "nginx": {
        "proxy": {
          "listen": "80",
          "server_name": "_",
          "location": {
            "name": "/",
            "proxy_set_header": [
                "X-Forwarded-For $proxy_add_x_forwarded_for;",
                "Host $http_host;"
            ],
            "proxy_pass": "http://0.0.0.0:9000"
          }
        }
      },
      "run_list":[ "recipe[subway]" ]
    }

    // custom example
    // defaults will still be applied
    // to overwite, set empty, like
    // 'proxy_set_header' below.
    {
      "nginx": {
        "proxy": {
          "listen": "9000",
          "location": {
            "name": "/myproxy",
            "proxy_set_header": [],
            "proxy_pass_header": "X-Auth;",
            "proxy_pass": "http://0.0.0.0:3000"
          }
        }
      },
      "run_list":[ "recipe[subway]" ]
    }

### TODO:

Fix 'proxy_set_header' default, as it stands, those values can't be removed
unless the entire setting is left empty.

