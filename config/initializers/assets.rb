# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )

Rails.application.config.assets.precompile += %w( commontator/upvote_disabled.png )
Rails.application.config.assets.precompile += %w( commontator/downvote_disabled.png )
Rails.application.config.assets.precompile += %w( commontator/upvote_hover.png )
Rails.application.config.assets.precompile += %w( commontator/downvote_hover.png )
Rails.application.config.assets.precompile += %w( commontator/upvote.png )
Rails.application.config.assets.precompile += %w( commontator/downvote.png )
Rails.application.config.assets.precompile += %w( commontator/upvote_active.png )
Rails.application.config.assets.precompile += %w( commontator/downvote_active.png )

Rails.application.config.assets.precompile += %w( razorpay-logo.jpg )
Rails.application.config.assets.precompile += %w( payment-modes.png )

Rails.application.config.assets.precompile += %w( new-global.css )
Rails.application.config.assets.precompile += %w( onboarding.css )
Rails.application.config.assets.precompile += %w( account.css )
Rails.application.config.assets.precompile += %w( browse.css )

Rails.application.config.assets.precompile += %w( pace.min.js )
Rails.application.config.assets.precompile += %w( ratyrate.js )
