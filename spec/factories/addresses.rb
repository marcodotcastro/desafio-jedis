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
FactoryBot.define do
  factory :address do
    cep { '88701-210' }
    street { 'Rua Quinze De Novembro' }
    neighborhood { 'Centro' }
    city { 'Tubarão' }
    uf { 'Santa Catarina' }
    complement { 'Perto da Padaria' }
    ibge { '12344' }
  end
end
