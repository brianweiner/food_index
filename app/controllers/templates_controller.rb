class TemplatesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def page
    @path = params[:path]
    render :template => 'recipe_app/' + @path, :layout => nil
  end

  def css
    @path = params[:path]
    render :template => 'recipe_app/' + @path + ".css", :layout => nil, content_type: Mime::CSS
  end
  
  def js
    @path = params[:path]
    render :template => 'recipe_app/' + @path, :layout => nil, content_type: Mime::JS
  end
end
