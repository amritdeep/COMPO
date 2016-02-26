# require 'csv'
# require 'FileUtils'

class HomeController < ApplicationController
  include Scraper

  def index
    @document = Document.all
  end

  def new
  end

  def upload
  	@upload_file = params['file']
    if @upload_file.present?
    	@file_name = @upload_file.original_filename
    	@file_type = @upload_file.content_type

      check_file_extention_and_upload(@upload_file, @file_type, @file_name)
      check_column(@upload_file, @file_type, @file_name)

      @doc_arry.each do |doc|
        if doc.count == 2
          @document = Document.new  
          @document.type = doc[0] 
          @document.name = doc[1]
          @document.save
        end
      end
      flash[:notice] = "Successfully upload #{@file_name}"
      redirect_to root_path

    	## Save to Document Model
  		# @document = Document.new(name: @file_name, type: @file_type) 
    #   check_doc_extention(@document)

    #   binding.pry

    #   respond_to do |format|
    #     if @document.save
    #       flash[:notice] = "Successfully upload #{@file_name}"
    #     else
    #       flash[:notice] = "#{@file_name} already exits."
    #     end
    #      format.html { redirect_to root_path }
    #   end
    else
      flash[:notice] = "Please upload the file"
      redirect_to root_path
    end

  end

end