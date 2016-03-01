# /lib/scraperzip.rb
require 'rubygems'
require 'pry'
require 'csv'
require 'zip'
require 'logger'


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

	def compare_zip_with_content
		Zip::File.open('Fund IIQ 4Q15 PCAP PDFs Q.zip') do |zip_file|
		  # Handle entries one by one
		  zip_file.each do |entry|
		    entry_name = entry.name.gsub("KPEO II(Q), LP - 4Q15 Capital Statements - ", "")
		    entry_pdf = entry_name.gsub(".pdf", "")

		    file_name << entry_pdf
		  end
		end
	end


end