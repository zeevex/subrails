# Subrails

  Adding better subdomain support to raisl


# Routing

## Methods:

### subdomain

    # An alias for constraints :subdomain => 'www' do…
    subdomain :www do
      …
    end

    # An alias for constraints :subdomain => /things|stuff|radsauce/ do…
    subdomain :things, :stuff, :radsauce do
      …
    end


### redirect\_to_subdomain


    match 'posts(/:id)' => redirect_to_subdomain(:www, 'blog/posts/%{id}')
