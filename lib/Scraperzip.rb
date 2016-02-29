# /lib/scraperzip.rb
require 'rubygems'
require 'pry'
require 'csv'
# require 'zip'


module Scraperzip

	def check_zip_file(files, type, name)
		## Check the extention	
	    if type == "application/zip" && name.slice(-3..-1) == "zip"
	      puts "Ready to go"
	      ## Handle the upload
	      File.open(Rails.root.join('public', 'upload', name), 'wb') do |file|
	        file.write(files.read)
	      end	      
	  	else
	  		puts "Not Zip File"
	    end	
	end


end