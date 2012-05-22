# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class PasswordValidator < ActiveModel::Validator
  def validate(record) 
    record.errors[:base] << "cant have blank password" if record.password.blank?
    record.errors[:base] << "confirmation doesnt match" if record.password != record.password_confirmation
  end
end


class User < ActiveRecord::Base

  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password

  validates :name, presence: true, length: { maximum: 50 }, uniqueness: true

  validates :password, presence: true
  validates_with PasswordValidator
  validates :password, length: { minimum: 6 }


end






