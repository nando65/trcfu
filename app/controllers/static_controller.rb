class StaticController < ApplicationController

  def homepage
    @all_links=Course.all

  end
end