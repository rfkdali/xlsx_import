# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  first_name :string
#  last_name  :string
#  email      :string
#  import_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_contacts_on_import_id  (import_id)
#
# Foreign Keys
#
#  fk_rails_a2e82c9f09  (import_id => imports.id)
#

class Contact < ApplicationRecord
  belongs_to :import

  validates :first_name, :last_name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates_format_of :email,:with => /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :first_name, :last_name, length: { minimum: 3 }
  validate :full_name_uniqueness

  def full_name
    "#{first_name} #{last_name}"
  end
  
  def full_name_uniqueness
    if Contact.exists?(first_name: first_name, last_name: last_name)
     errors.add :base, "#{full_name} already exists"
    end
  end
end
