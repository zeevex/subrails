require 'action_dispatch/routing/mapper'

module ActionDispatch::Routing::Mapper::Subdomains

  def subdomain *subdomains, &block
    subdomain = subdomains.length == 1 ? subdomains.first.to_s : /#{subdomains.join('|')}/
    constraints(:subdomain => subdomain, &block)
  end

  def redirect_to_subdomain subdomain, path='/', &block
    redirect{ |params, req|
      path          = block.call(params, req) if block
      path          = path % params
      uri           = URI.parse(path)
      uri.scheme    = req.scheme
      uri.host      = req.host
      uri.subdomain = subdomain
      uri.port      = req.port unless req.standard_port?
      uri.to_s
    }
  end

  ActionDispatch::Routing::Mapper.send :include, self

end

