Dummy::Application.routes.draw do
  subdomain :www do
    match "foo" => "subrails#foo"
  end

  subdomain :hey, :guys do
    match "bar" => "subrails#bar"
  end

  match "baz" => redirect("blah", subdomain: :www)
end
