# == Schema Information
#
# Table name: list_contacts
#
#  id         :integer          not null, primary key
#  first_name :string
#  last_name  :string
#  email      :string
#  reason     :string
#  validated  :boolean          default(FALSE)
#  import_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_list_contacts_on_import_id  (import_id)
#
# Foreign Keys
#
#  fk_rails_306093da3e  (import_id => imports.id)
#

class ListContact < ApplicationRecord
  belongs_to :import
end
