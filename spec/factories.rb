
FactoryGirl.define do
  factory :user do
    name 'name'
    email { "#{name}@casamasomenos.net"}
  end

  factory :article do
    title 'title'
    author
    category
    state 'published'
  end
end
