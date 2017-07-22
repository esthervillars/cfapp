FactoryGirl.define do

  sequence(:id) { |n| "#{n}" }

  factory :product do
    
    name "Test Bike"
    description "folding bike is a great all-rounder with excellent functions"
    colour "black"
    price "25.99"
    image_url "http://test.com/test.jpeg"
    id
    
  end
end