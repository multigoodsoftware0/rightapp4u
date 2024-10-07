class PagesController < ApplicationController

  before_action :authenticate_user!, only: :account

  def about
  end

  def contact
  end

  def terms
  end

  def privacy
  end

  def careers
  end

  def business
  end

  def account
  end
  
end
