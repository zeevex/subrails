# Subrails

  Adding better subdomain support to rails 3

# Routing

### scoping routes to a subdomain:

    # this:
    subdomain :www do
      …
    end

    # is equal to this
    constraints(:subdomain => 'www') do
      defaults(:subdomain => 'www') do
        …
      end
    end

### scoping routes to multiple subdomains:

    # this:
    subdomain :things, :stuff, :radsauce do
      …
    end

    # is equal to this
    constraints(lambda{ |req| [:things, :stuff, :radsauce].include? req.subdomain.to_s }) do
      …
    end


### redirecting to another subdomain

    match 'posts(/:id)' => redirect('blog/posts/%{id}', :subdomain => :www)

# Url Helpers

### subrails adds support for the :subdomain option to url_for

    root_url                        #=> 'http://www.example.com'
    root_url(:subdomain => 'blog')  #=> 'http://blog.example.com'


# Rspec

  Controller tests that respond to routes that include a subdomain restraint require that your pass
  :subdomain => '…' as a parameter when requesting an action.

### For example:

  Given the following routes

    subdomain :blog do
      resources :posts
    end

  This no longer works

    describe PostsController do
      it "should respond to the index action" do
        get :index # => Unknown Route
      end
    end

  You now need to include the appropriate subdomain param

    describe PostsController do
      it "should respond to the index action" do
        get :index, :subdomain => 'blog'
      end
    end

  to make this easier we've added a default_params hash that is reverse merged into your params so you can again do this:

    describe PostsController do
      before do
        default_params[:subdomain] = 'www'
      end

      it "should respond to the index action" do
        get :index
      end
    end
