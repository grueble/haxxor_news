# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :upvote, :class => Vote do
    user
    association :votable, :factory => :article
    sign 1
  end
end