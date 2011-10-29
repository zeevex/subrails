# this adds a default_params hash to controller specs that makes the need to pass
# :subdomain => '…' to each request a little easier
module ActionController::TestCase::DefaultParams

  def default_params
    @default_params ||= {}
  end

  def default_params= default_params
    @default_params = default_params
  end

  def process(action, parameters = nil, session = nil, flash = nil, http_method = 'GET')
    parameters ||= {}
    parameters = default_params.merge(parameters)
    super
  end

  RSpec.configure do |c|
    c.include self, :type => :controller
  end

end
