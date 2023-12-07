# == Schema Information
#
# Table name: citizens
#
#  id         :bigint           not null, primary key
#  full_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :citizen do
    full_name { "MyString" }
  end
end
