require 'csv'
require 'FileUtils'

class HomeController < ApplicationController
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
      
      @doc_arry.each do |doc|
        if doc.count == 2
          @document = Document.new
          @document.type = doc[0] 
          @document.name = doc[1]
          @document.save
        end
      end

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
    # else
    #   flash[:notice] = "Please upload the file"
    #   redirect_to root_path
    end

  end

  private

  def check_column(file_name)
    binding.pry
    @doc_arry = []
    file_path = "public/upload/#{file_name}"
    @csv_file = CSV.read(file_path)
    @csv_file.each do |i|
      @doc_arry << i.compact
    end
  end

  # def check_doc_extention(document)
  #   if document.type == "text/csv" && (document.name.slice(-3..-1) == "csv" || )
  #     document.type = "CSV"
  #   else
  #     document.type = ""
  #   end
  # end

  def check_file_extention_and_upload(files, type, name)
    ## Check the extention
    if type == "text/csv" && name.slice(-3..-1) == "csv"
      puts "Ready to go"
      ## Handle the upload
      File.open(Rails.root.join('public', 'upload', name), 'wb') do |file|
        file.write(files.read)
      end

    else
      binding.pry
      files.close
    end 

    check_column(name)    
  end

end
