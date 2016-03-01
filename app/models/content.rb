class Content < ActiveRecord::Base
  belongs_to :document

  
  has_attached_file :document, styles: {thumbnail: "60x60#"}
  validates_attachment :document, content_type: { content_type: "application/pdf" }  
end
