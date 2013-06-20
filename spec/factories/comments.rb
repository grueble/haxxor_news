# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    user
    article
    association :commentable, factory: :article
    body "Insert Text Here"
  end
end
