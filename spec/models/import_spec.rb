require 'rails_helper'

RSpec.describe Import, type: :model do
  it 'has a valid factory' do
    import = FactoryGirl.build(:import)
    expect(import).to be_valid
  end
end
