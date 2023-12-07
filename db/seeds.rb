if Rails.env.development?
  AdminUser.create!(email: 'admin@mail.com',
                    password: 'password', password_confirmation: 'password')
  Citizen.create(full_name: 'Gessica Dutra',
                 cpf: '03997653283',
                 cns: '854154873000008',
                 date_birth: '15/04/1971'.to_date,
                 email: 'gessica.dutra@gmail.com',
                 phone: '5568981278826')
  Citizen.create(full_name: 'Aline Machado',
                 cpf: '23872851403',
                 cns: '294250161890007',
                 date_birth: '15/04/1998'.to_date,
                 email: 'aline.machado@gmail.com',
                 phone: '5594975366263',
                 active: false)
end
