# == Schema Information
#
# Table name: contacts
#
#  id           :integer          not null, primary key
#  first_name   :string(255)
#  last_name    :string(255)
#  phone_number :string(255)
#  email        :string(255)
#  address      :string(255)
#  company      :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer
#

class Contact < ActiveRecord::Base
  attr_accessible :address, :company, :email, :first_name, :last_name, :phone_number
  belongs_to :user

  # VALID_PHONE_NUMBER_REGEX = /^\d+$/

  # validates :phone_number, format: { with: VALID_PHONE_NUMBER_REGEX }

  validates :phone_number, presence: true, uniqueness: true

  default_scope order: 'contacts.first_name ASC'
end
