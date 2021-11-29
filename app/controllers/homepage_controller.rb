class HomepageController < ApplicationController
  def show
    @test = Event.all
  end
end
