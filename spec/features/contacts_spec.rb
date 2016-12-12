require 'rails_helper'

RSpec.feature "Contacts", type: :feature do
  scenario 'Contacts list page' do
    visit '/'
  end
end
