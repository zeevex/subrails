# Subrails

  Adding better subdomain support to rails 3

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


### redirect

  subrails makes it easy to redirect to another subdomain

    match 'posts(/:id)' => redirect('blog/posts/%{id}', :subdomain => :www)


# Url Helpers

  subrails adds support for the :subdomain => "…" as an option to url_for

    root_url(:subdomain => 'blog')