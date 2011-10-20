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
