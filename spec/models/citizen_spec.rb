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
require 'rails_helper'

RSpec.describe Citizen, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:full_name) }
    it { should validate_presence_of(:cns) }
    it { should validate_presence_of(:cpf) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:birthday) }
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
    context 'email' do
      it 'valid' do
        citizen = build(:citizen)
        citizen.valid?

        expect(citizen).to be_valid
      end

      it 'invalid' do
        citizen = build(:citizen, email: 'meu.email.com')
        citizen.valid?

        expect(citizen).to_not be_valid
        expect(citizen.errors[:email]).to include('não é um e-mail válido')
      end
    end
    context 'cns' do
      it 'valid' do
        citizen = build(:citizen)
        citizen.valid?

        expect(citizen).to be_valid
      end

      it 'invalid' do
        citizen = build(:citizen, cns: '111111111111111')
        citizen.valid?

        expect(citizen).to_not be_valid
        expect(citizen.errors[:cns]).to include('não é um CNS válido')
      end
    end
    context 'birthday' do
      it 'valid' do
        citizen = build(:citizen)
        citizen.valid?

        expect(citizen).to be_valid
      end

      context 'invalid' do
        it 'not future' do
          citizen = build(:citizen, birthday: (Time.zone.today + 1.day))
          citizen.valid?

          expect(citizen).to_not be_valid
          expect(citizen.errors[:birthday]).to include('deve ser uma data no passado')
        end

        it 'up to 120 years' do
          citizen = build(:citizen, birthday: (Time.zone.today - 121.years))
          citizen.valid?

          expect(citizen).to_not be_valid
          expect(citizen.errors[:birthday]).to include('deve ser menor que 120 anos atrás')
        end
      end
    end
  end
end
