class SessionsController < ::Devise::SessionsController
  include ::ActiveAdmin::Devise::Controller
  skip_before_action :set_cart
end

class PasswordsController < ::Devise::PasswordsController
  include ::ActiveAdmin::Devise::Controller
  skip_before_action :set_cart
end

class UnlocksController < ::Devise::UnlocksController
  include ::ActiveAdmin::Devise::Controller
  skip_before_action :set_cart
end

class RegistrationsController < ::Devise::RegistrationsController
  include ::ActiveAdmin::Devise::Controller
  skip_before_action :set_cart
end

class ConfirmationsController < ::Devise::ConfirmationsController
  include ::ActiveAdmin::Devise::Controller
  skip_before_action :set_cart
end

class ActiveAdmin::CommentsController  < ApplicationController
  skip_before_action :set_cart
end
