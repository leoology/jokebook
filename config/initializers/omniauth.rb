Rails.application.config.middleware.use OmniAuth::Builder do
    provider :google_auth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET']
  end 
  #TODO finish this third party authentication, watch matteo's video