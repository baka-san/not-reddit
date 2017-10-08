FactoryGirl.define do
  factory :vote do
    # value [-1, 1].sample
    value
    post
    user
  end
end