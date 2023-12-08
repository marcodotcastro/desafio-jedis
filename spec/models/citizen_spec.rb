# == Schema Information
#
# Table name: citizens
#
#  id         :bigint           not null, primary key
#  active     :boolean          default(TRUE)
#  cns        :string
#  cpf        :string
#  date_birth :date
#  email      :string
#  full_name  :string
#  phone      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Citizen, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:full_name) }
    it { should validate_presence_of(:cns) }
    it { should validate_presence_of(:cpf) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:date_birth) }
    it { should validate_presence_of(:phone) }
  end

  describe 'custom validations' do
    context 'cpf' do
      it 'valid' do
        citizen = build(:citizen, cpf: '03997653283')
        citizen.valid?

        expect(citizen).to be_valid
      end

      it 'invalid' do
        citizen = build(:citizen, cpf: '111111111111')
        citizen.valid?

        expect(citizen).to_not be_valid
        expect(citizen.errors[:cpf]).to include('não é um CPF válido')
      end
    end
  end
end
