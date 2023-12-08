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
  pending "add some examples to (or delete) #{__FILE__}"
end
