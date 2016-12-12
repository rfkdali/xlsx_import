# == Schema Information
#
# Table name: imports
#
#  id         :integer          not null, primary key
#  name       :string
#  attachment :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Import < ApplicationRecord
  has_many :contacts
end
