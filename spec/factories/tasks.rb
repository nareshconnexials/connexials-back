FactoryBot.define do
  factory :task do
    working_hours { 1.5 }
    status { "MyString" }
    description { "MyString" }
  end
end
