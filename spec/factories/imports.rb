FactoryGirl.define do
  factory :import do
    file File.open("#{Rails.root}/spec/support/example_input.tab")
  end
end
