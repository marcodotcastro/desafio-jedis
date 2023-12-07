# == Schema Information
#
# Table name: citizens
#
#  id         :bigint           not null, primary key
#  full_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Citizen < ApplicationRecord

  validates :full_name, presence: true

  def to_s
    full_name
  end
end
