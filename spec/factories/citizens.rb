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
FactoryBot.define do
  factory :citizen do
    full_name { FFaker::Name.name }
    cns { '294250161890007' }
    cpf { '23872851403' }
    email { FFaker::Internet.email }
    birthday do
      FFaker::Time.between(
        (Time.zone.today - 120.years),
        Time.zone.today
      ).to_date
    end
    phone { "55#{FFaker::PhoneNumberBR.mobile_phone_number.gsub(/[^\d]/, '')}" }
    photo do
      Rack::Test::UploadedFile.new('spec/support/images/mulher-1.jpg',
                                   'image/png')
    end

    address { build(:address, citizen: instance) }
  end
end
