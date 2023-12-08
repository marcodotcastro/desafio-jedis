if Rails.env.development?
  AdminUser.create!(email: 'admin@mail.com',
                    password: 'password', password_confirmation: 'password')
  citizen1 = Citizen.create(full_name: 'Gessica Dutra',
                            cpf: '03997653283',
                            cns: '854154873000008',
                            birthday: '15/04/1971'.to_date,
                            email: 'gessica.dutra@gmail.com',
                            phone: '5568981278826')

  citizen1.photo.attach(io: File.open(Rails.root.join('spec', 'support', 'images', 'mulher-1.jpg')), filename: 'mulher-1', content_type: 'image/jpg')
  Address.create(cep: '	88870-970', city: 'Orleans', neighborhood: 'Centro', street: 'Rua Quinze de Novembro 305 Sala 03', uf: 'SC', citizen: citizen1)

  citizen2 = Citizen.create(full_name: 'Aline Machado',
                            cpf: '23872851403',
                            cns: '294250161890007',
                            birthday: '15/04/1998'.to_date,
                            email: 'aline.machado@gmail.com',
                            phone: '5594975366263',
                            active: false)

  citizen2.photo.attach(io: File.open(Rails.root.join('spec', 'support', 'images', 'mulher-2.jpg')), filename: 'mulher-2', content_type: 'image/jpg')
  Address.create(cep: '88275-970', city: 'Nova Trento', neighborhood: 'Claraíba', street: 'Estrada Geral de Claraíba, s/n', uf: 'SC', citizen: citizen1)
end
