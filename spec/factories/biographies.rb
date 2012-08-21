# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :biography do
    para1 "MyText"
    para2 "MyText"
    para3 "MyText"
    displayname "MyString"
    livesin "MyString"
  end
end
