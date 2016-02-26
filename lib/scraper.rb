# /lib/scraper.rb
require 'rubygems'
require 'pry'
require 'csv'
# require 'zip'


module Scraper
  def check_column(files, file_typ, file_name)
    @content_arry = []
    if file_typ == "text/csv" && file_name.slice(-3..-1) == "csv"    
      file_path = "public/upload/#{file_name}"
      @csv_file = CSV.read(file_path)
      @csv_file.each do |i|
        @content_arry << i.compact
      end
    else
      files.close
      puts "File is close"
    end
  end

  def check_doc_extention(document)
    if document.type == "text/csv" && document.name.slice(-3..-1) == "csv" 
      document.type = "CSV"
    else
      document.type = ""
    end
  end

  def check_file_extention_and_upload(files, type, name)
    ## Check the extention
    if type == "text/csv" && name.slice(-3..-1) == "csv"
      puts "Ready to go"
      ## Handle the upload
      File.open(Rails.root.join('public', 'upload', name), 'wb') do |file|
        file.write(files.read)
      end
    else
      puts "Its not CSV file. Its #{type} file"
    end 
  end

end
