class HomeController < ApplicationController
  include Scrapercsv
  include Scraperzip

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

    	## Save to Document Model
  		@document = Document.new(name: @file_name, type: @file_type) 
      check_doc_extention(@document)

      respond_to do |format|
        if @document.save
          # flash[:notice] = "Successfully upload #{@file_name}"
          @content_arry.each do |content|
            if content.count == 2
              @content = Content.create!(name: content[1], content_id: content[0], document_id: @document.id)
              flash[:notice] = "File is uploaded Successfully. And able to store its content"
            end
          end
        else
          flash[:notice] = "#{@file_name} doesn't fullfilled the requirement or already exits"
        end
         format.html { redirect_to root_path }
      end
    else
      flash[:notice] = "Please upload the file"
      redirect_to root_path
    end
  end

  def show
    @document = Document.find(params[:id])
    # @content = Content.where(document_id: paras[:id])
    @content = Content.where(document_id: @document.id)
  end

  def zip_upload
    @zipfile = params['zipfile']
    if @zipfile.present?
      @zipfile_name = @zipfile.original_filename
      @zipfile_type = @zipfile.content_type
      check_zip_file(@zipfile, @zipfile_type, @zipfile_name)
    # binding.pry
      
      redirect_to content_path(params[:id])
    else
      flash[:notice] = "Please upload the file"
      redirect_to content_path(params[:id])
    end    
  end

end