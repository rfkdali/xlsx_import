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
end
