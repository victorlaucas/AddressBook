class Contact < ApplicationRecord
  validates_presence_of :name, :address, :email, :phone
  EMAIL_REGEX = /\A\S+@.+\.\S+\z/

  validates_format_of :email, with: EMAIL_REGEX 

  PHONE_REGEX = /\A[0-9]*\Z/

  validates_format_of :phone, with: PHONE_REGEX

  validates :phone, length: { is: 10 } 
  scope :sort_by_name, -> { order('name ASC') }
end
