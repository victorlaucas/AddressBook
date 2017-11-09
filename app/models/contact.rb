class Contact < ApplicationRecord
  validates_presence_of :name, :address, :email, :phone 
  scope :sort_by_name, -> { order('name ASC') }
end
