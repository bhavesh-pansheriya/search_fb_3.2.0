search_fb_3.2.0 -is login with facebook then user can search from facebook. Implemented search using facebook api.
==========
Developed with rails 3.2.0

Step to configure
==========

bundle install
rake db:create
rake db:migrate

You need to add access key & secret of facebook's developer account into /config/initializers/devise.rb line config.omniauth :facebook, "413172082051563", "1ccd6ae1ec9ff99b62122932dd260ab0" for login with facebook.
