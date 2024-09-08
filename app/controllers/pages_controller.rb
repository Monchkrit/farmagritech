class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:about, :contact, :terms, :privacy]
  def about
  end

  def contact
  end

  def terms
  end

  def privacy
  end

  def fatlsp
  end
end
