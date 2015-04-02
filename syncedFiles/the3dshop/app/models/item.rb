class Item < ActiveRecord::Base

	belongs_to :user
	has_many :order_items
	has_many :categories


    has_attached_file :image, styles: { med: "250x250", big: "450x450" }

    validates :name, presence: true
	validates :price, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ }, :numericality => {:greater_than => 0}
	validates :description, presence: true
	validates :preview_description, presence: true

    validates_attachment :image, 
      :presence => true,
      :content_type => { :content_type => /^image\/(png|gif|jpeg)/}
end
