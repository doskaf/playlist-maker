Rails.application.config.middleware.use OmniAuth::Builder do
    provider :github, 'fb96b5a208cf13433c26', '44db6d0184e29a7490d468793946c1655d84529c'
end