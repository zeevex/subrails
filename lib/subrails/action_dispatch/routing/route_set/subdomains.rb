class ActionDispatch::Routing::RouteSet

  TLD_SIZE = 1

  # this adds support for
  #   url_for(…, :subdomain => nil)
  #   url_for(…, :subdomain => 'www')
  #   url_for(…, :subdomain => 'news')
  def url_for_with_subdomain_support options={}
    options ||= {}
    if options.kind_of?(Hash) && options.has_key?(:subdomain)
      subdomain = options.delete(:subdomain)
      host      = options[:host] || default_url_options[:host]
      domain    = host.split('.').last(1 + TLD_SIZE).join('.')
      options[:host] = subdomain.present? ? "#{subdomain}.#{domain}" : domain
    end
    url_for_without_subdomain_support(options)
  end

  alias_method_chain :url_for, :subdomain_support

end
