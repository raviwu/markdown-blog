# frozen_string_literal: true

FactoryGirl.define do
  factory :user do
    username 'Joe Doe'
    email 'joe_doe@test.dev'
    password 'password'
  end
end
