class HomeController < ApplicationController
  def index
    @document = Document.all
  end

  def new
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
		@document = Document.new(name: @file_name, type: @file_type)

    respond_to do |format|
      if @document.save
        flash[:notice] = "Successfully upload #{@file_name}"
      else
        flash[:notice] = "#{@file_name} already exits"
      end
       format.html { redirect_to root_path }

    end

  end




end
