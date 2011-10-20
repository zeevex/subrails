require 'action_dispatch/routing/mapper'
require 'uri-subdomain'

module ActionDispatch::Routing::Mapper::Subdomains

  def subdomain *subdomains, &block
    subdomains = subdomains.map(&:to_s)

    if subdomains.length == 1
      constraints(:subdomain => subdomains.first) do
        defaults(:subdomain => subdomains.first) do
          yield
        end
      end
    else
      constraints(lambda{ |req| subdomains.include? req.subdomain.to_s }, &block)
    end
  end

  # *adds support for :subdomain option
  # Redirect any path to another path:
  #
  #   match "/stories" => redirect("/posts")
  #   match "/posts" => redirect("/posts", :subdomain => :blog)
  def redirect(*args, &block)
    options = args.last.is_a?(Hash) ? args.pop : {}

    path      = args.shift || block
    path_proc = path.is_a?(Proc) ? path : proc { |params| path % params }
    status    = options[:status] || 301

    lambda do |env|
      req = ActionDispatch::Request.new(env)

      params = [req.symbolized_path_parameters]
      params << req if path_proc.arity > 1

      uri = URI.parse(path_proc.call(*params))
      uri.scheme  ||= req.scheme
      uri.host    ||= req.host
      uri.subdomain = options[:subdomain] if options.has_key?(:subdomain)
      uri.port    ||= req.port unless req.standard_port?

      body = %(<html><body>You are being <a href="#{ERB::Util.h(uri.to_s)}">redirected</a>.</body></html>)

      headers = {
        'Location' => uri.to_s,
        'Content-Type' => 'text/html',
        'Content-Length' => body.length.to_s
      }

      [ status, headers, [body] ]
    end
  end

  ActionDispatch::Routing::Mapper.send :include, self

end

