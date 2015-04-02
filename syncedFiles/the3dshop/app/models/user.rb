class User < ActiveRecord::Base
  
  	has_many :items
  	validates :firstname, presence: true
	validates :lastname, presence: true
	validates_format_of :phone_number, with: /\A\(?([0-9]{3})\)?[-.● _]?([0-9]{3})[-.● _]?([0-9]{4})\Z/
	validates_format_of :email, :with => /\A(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})\z/i

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
