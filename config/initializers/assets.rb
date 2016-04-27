# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )


Rails.application.config.assets.precompile += %w( '/assets/fonts/FontAwesome.otf' )
Rails.application.config.assets.precompile += %w( '/assets/fonts/fontawesome-webfont.eot' )
Rails.application.config.assets.precompile += %w( '/assets/fonts/fontawesome-webfont.svg' )
Rails.application.config.assets.precompile += %w( '/assets/fonts/fontawesome-webfont.ttf' )
Rails.application.config.assets.precompile += %w( '/assets/fonts/fontawesome-webfont.woff' )
Rails.application.config.assets.precompile += %w( '/assets/fonts/fontawesome-webfont.woff2' )
Rails.application.config.assets.precompile += %w( projects.js )