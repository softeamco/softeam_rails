class PagesController < ApplicationController
  include HighVoltage::StaticPage
  skip_before_filter :authenticate_user!
  layout :layout_for_page

  private

  def layout_for_page
    case params[:id]
    when 'home'
      'application'
    else
      'application'
    end
  end
end
