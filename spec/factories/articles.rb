FactoryGirl.define do
  factory :article do
    user
    title "My Title"
    link "http://www.example.com/some/article"
  end
end
