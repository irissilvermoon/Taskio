FactoryGirl.define do
  factory :user do
    email "example@taskio.com"
    password "password"
    password_confirmation "password"

    factory :confirmed_user do
      email "confirmed@user.com"
      after_create do |user|
        user.confirm!
      end
    end
  end
end