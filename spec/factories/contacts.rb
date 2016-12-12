FactoryGirl.define do
  factory :contact do
    first_name "MyString"
    last_name "MyString"
    email FFaker::Internet.email
    import_id nil
  end
end
