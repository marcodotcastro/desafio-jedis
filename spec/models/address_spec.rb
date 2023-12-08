# == Schema Information
#
# Table name: addresses
#
#  id           :bigint           not null, primary key
#  cep          :string
#  city         :string
#  complement   :string
#  ibge         :string
#  neighborhood :string
#  street       :string
#  uf           :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  citizen_id   :bigint
#
# Indexes
#
#  index_addresses_on_citizen_id  (citizen_id)
#
require 'rails_helper'

RSpec.describe Address, type: :model do
  describe 'associations' do
    it { should belong_to(:citizen) }
  end

  describe 'validations' do
    it { should validate_presence_of(:cep) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:neighborhood) }
    it { should validate_presence_of(:street) }
    it { should validate_presence_of(:uf) }
  end
end
