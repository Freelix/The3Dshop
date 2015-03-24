# Change this to your host. See the readme at https://github.com/lassebunk/dynamic_sitemaps
# for examples of multiple hosts and folders.
host "http://the3dshop.ca"

sitemap :site do
  url root_url, last_mod: Time.now, change_freq: "daily", priority: 1.0
  url items_url, last_mod: Time.now, change_freq: "daily", priority: 1.0
  url new_user_session_url, last_mod: Time.now, change_freq: "daily", priority: 0.8
  url new_user_password_url, last_mod: Time.now, change_freq: "daily", priority: 0.3
  url new_user_registration_url, last_mod: Time.now, change_freq: "daily", priority: 0.8
  
  url user_url, last_mod: Time.now, change_freq: "daily", priority: 0.4
  url cart_url, last_mod: Time.now, change_freq: "daily", priority: 0.4
  url new_item_url, last_mod: Time.now, change_freq: "daily", priority: 0.3
end

# This line is used for create a symbolic link to the sitemap
# Run this command before proceed with "rake sitemap:generate"
#
# "ln -s public/sitemaps/sitemap.xml public/sitemap.xml"

# Ping search engines after sitemap generation:
ping_with "http://#{host}/sitemap.xml"

# Automatically link to all pages using the routes specified
# using "resources :pages" in config/routes.rb. This will also
# automatically set <lastmod> to the date and time in page.updated_at:
#
#   sitemap_for Page.scoped