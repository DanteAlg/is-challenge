FactoryGirl.define do
  factory :student do
    name 'Foo'
    sequence :register_number
    status 1
  end
end
