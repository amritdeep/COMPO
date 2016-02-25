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

  	## Save to Document Model
  	if @file_name.present? && @file_type.present?
  		@document = Document.new(name: @file_name, type: @file_type)

  		if @document.save!
	  		flash[:notice] = "Successfully upload #{@file_name}"
	  		render 'index'
  		end
  	else
  		redirect_to 'index', flash[:notice] = "Sorry could not upload file"
  	end


  end


end
