# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vote do
    user
    association :votable, :factory => :article
  end
  
  factory :upvote, :parent => :vote do
    sign 1
  end
  
  factory :downvote, :parent => :vote do
    sign -1
  end
end