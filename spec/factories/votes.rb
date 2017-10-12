FactoryGirl.define do
  factory :vote do
    value [-1, 1].sample
    # value :value
    post 
    user 
  end
end