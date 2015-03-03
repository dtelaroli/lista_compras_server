DeviseTokenAuth.setup do |config|
  # By default the authorization headers will change after each request. The
  # client is responsible for keeping track of the changing tokens. Change
  # this to false to prevent the Authorization header from changing after
  # each request.
  #config.change_headers_on_each_request = true

  # By default, users will need to re-authenticate after 2 weeks. This setting
  # determines how long tokens will remain valid after they are issued.
  #config.token_lifespan = 2.weeks

  # Sometimes it's necessary to make several requests to the API at the same
  # time. In this case, each request in the batch will need to share the same
  # auth token. This setting determines how far apart the requests can be while
  # still using the same auth token.
  #config.batch_request_buffer_throttle = 5.seconds

  # This route will be the prefix for all oauth2 redirect callbacks. For
  # example, using the default '/omniauth', the github oauth2 provider will
  # redirect successful authentications to '/omniauth/github/callback'
  #config.omniauth_prefix = "/omniauth"

  Rails.application.config.middleware.use OmniAuth::Builder do
    ENV['FACEBOOK_KEY'] = '419563724879727'
    ENV['FACEBOOK_SECRET'] = '1673f113c84e682ba0fe2f7c301e0df9'
    provider :facebook,      ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
    
    ENV['GOOGLE_KEY'] = '336517423411-bhgqvi5pvpgucqso45empn84lt55pg17.apps.googleusercontent.com'
    ENV['GOOGLE_SECRET'] = 'wykvvOwUzNTAWOKk7rYOcQ-9'
    provider :google_oauth2, ENV['GOOGLE_KEY'],   ENV['GOOGLE_SECRET']
  end

end