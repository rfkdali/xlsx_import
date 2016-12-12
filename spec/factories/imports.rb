FactoryGirl.define do
  factory :import do
    name "test_name"
    attachment { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'fixtures', 'file.xlsx')) }
  end
end
