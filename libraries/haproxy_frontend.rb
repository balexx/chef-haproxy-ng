#
# Cookbook Name: haproxy-ng
# Resource:: frontend
#

class Chef::Resource
  class HaproxyFrontend < Chef::Resource
    identity_attr :name

    def acls
      set_or_return(

      )
    end

    def backlog
      set_or_return(

      )
    end

    def bind
      set_or_return(

      )
    end

    def config
      set_or_return(

      )
    end

    def default_backend
      set_or_return(

      )
    end

    def maxconn
      set_or_return(

      )
    end

    def mode
      set_or_return(

      )
    end

    def server_port
      set_or_return(

      )
    end

    def use_backends
      set_or_return(

      )
    end
  end
end

class Chef::Provider
  class HaproxyFrontend < Chef::Provider

  end
end
