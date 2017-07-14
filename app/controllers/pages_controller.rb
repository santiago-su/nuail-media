class PagesController < ApplicationController

  def home
  end

  def video
  end

  def photo
  end

  def design
  end

  def editorial
  end

  def projects
    @videos = Video.all
    @designs = Design.all
    @photos = Photo.all
    @editorials = Editorial.all
    @featured = [Design.featured ,Photo.featured, Editorial.featured].sample
  end

end
