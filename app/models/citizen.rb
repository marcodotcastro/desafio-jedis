# == Schema Information
#
# Table name: citizens
#
#  id         :bigint           not null, primary key
#  active     :boolean          default(TRUE)
#  birthday   :date
#  cns        :string
#  cpf        :string
#  email      :string
#  full_name  :string
#  phone      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Citizen < ApplicationRecord
  has_one_attached :photo

  has_one :address
  accepts_nested_attributes_for :address

  validates :full_name, :cns, :cpf, :email, :birthday, :phone, presence: true
  validates :cpf, cpf: true
  validates :email, email: true
  validates :cns, cns: true
  validates :birthday, birthday: { max_age: 120 }

  def to_s
    full_name
  end
end
