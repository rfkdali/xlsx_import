require 'rails_helper'

RSpec.describe Contact, type: :model do
  let(:import) { FactoryGirl.create(:import) }

  it 'has a valid factory' do
    expect(FactoryGirl.build(:contact, import: import)).to be_valid
  end

  it "is invalid without a firstname" do
    expect(FactoryGirl.build(:contact, import: import, first_name: nil)).not_to be_valid
  end

  it "is invalid without a lastname" do
    expect(FactoryGirl.build(:contact, import: import, last_name: nil)).not_to be_valid
  end

  it "is invalid without an email" do
    expect(FactoryGirl.build(:contact, import: import, email: nil)).not_to be_valid
  end

  it "has a unique email" do
    contact2 = FactoryGirl.create(:contact, import: import, email: 'test@test.com')
    expect(FactoryGirl.build(:contact, import: import, email: 'test@test.com')).not_to be_valid
  end

  it "doesn't accept bad email format" do
    expect(FactoryGirl.build(:contact, import: import, email: 'teùst$*@test.com')).not_to be_valid
  end

  it "doesn't accept short first_name or last_name (min 3 letters)" do
    expect(FactoryGirl.build(:contact, import: import, first_name: 'ab')).not_to be_valid
    expect(FactoryGirl.build(:contact, import: import, last_name: 'b')).not_to be_valid
  end

  it "has a unique full name" do
    contact2 = FactoryGirl.create(:contact, import: import, first_name: 'Yvan', last_name: 'Dullet', email: "test@email.com")
    expect(FactoryGirl.build(:contact, import: import, first_name: 'Yvan', last_name: 'Dullet')).not_to be_valid
  end

end
