# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    user
    association :commentable, factory: :article
    body "Generic Text Submission"
  end
end
