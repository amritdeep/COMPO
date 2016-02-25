class HomeController < ApplicationController
  def index
  end

  def upload
  	@upload_file = params['file']
  	@file_name = @upload_file.original_filename
  	@file_type = @upload_file.content_type

  	## Upload to public/upload folder
  	File.open(Rails.root.join('public', 'upload', @file_name), 'wb') do |file|
  		file.write(@upload_file.read)
  		
  	end

  	flash[:notice] = "Successfully upload #{@file_name}"
  	render 'index'

  end


end
