require 'action_dispatch/routing/mapper'

module ActionDispatch::Routing::Mapper::Subdomains

  def subdomain *subdomains, &block
    subdomains = subdomains.map(&:to_s)
    if subdomains.length == 1
      constraints(:subdomain => subdomains.first, &block)
    else
      constraints(lambda{ |req| subdomains.include? req.subdomain.to_s }, &block)
    end
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

