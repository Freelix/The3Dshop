class Item < ActiveRecord::Base

	belongs_to :user

    has_attached_file :image, styles: { med: "250x250", big: "450x450" }

    validates_attachment :image, 
      :presence => true,
      :content_type => { :content_type => "image/jpeg" }
end
