require 'faker'

FactoryGirl.define do

    # factory :article do
    #     title 'Article Title'
    #     summary 'Article summary'
    #     company { |p| p.association(:company) }
    #     document_file_name { 'test.jpg' }
    #       document_content_type { 'image/jpeg' }
    #       document_file_size { 256 }
    # end

	factory :attachment do
		file ActionDispatch::Http::UploadedFile.new(:tempfile => File.new("#{Rails.root}/spec/fixtures/anyfile.txt"), :filename => "anyfile.txt")
	end

end