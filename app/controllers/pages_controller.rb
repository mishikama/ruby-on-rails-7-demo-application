class PagesController < ApplicationController
  def home
     # nothing to do here
     @categories = Category.all
  end
  
  def about
  end
  
  def contact
  end
end
