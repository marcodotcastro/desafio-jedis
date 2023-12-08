require 'rails_helper'

RSpec.feature 'Manager Citizens', type: :feature do
  before do
    create(:citizen, full_name: 'Cidadão 1')
    create(:citizen, full_name: 'Cidadão 2')
  end

  scenario 'list citizens' do
    visit manager_citizens_path

    expect(page).to have_text('Cidadão 1')
    expect(page).to have_text('Cidadão 2')
  end

  scenario 'create citizen' do
    visit new_manager_citizen_path

    find('#citizen_full_name', match: :first).set('Cidadão 3')
    attach_file('citizen[photo]', 'spec/support/images/mulher-1.jpg')
    find('#citizen_birthday_1i', match: :first).set('15')
    find('#citizen_birthday_2i', match: :first).set('4')
    find('#citizen_birthday_3i', match: :first).set('1974')
    find('#citizen_cpf', match: :first).set('03997653283')
    find('#citizen_phone', match: :first).set('5561999995555')
    find('#citizen_cns', match: :first).set('854154873000008')
    find('#citizen_email', match: :first).set('gessica.dutra@gmail.com')

    find('#citizen_address_attributes_cep', match: :first).set('88701-210')
    find('#citizen_address_attributes_street', match: :first).set('Rua Quinze De Novembro')
    find('#citizen_address_attributes_neighborhood', match: :first).set('Centro')
    find('#citizen_address_attributes_city', match: :first).set('Tubarão')
    find('#citizen_address_attributes_uf', match: :first).set('Santa Catarina')

    click_button I18n.t('views.manager.citizens.save')

    expect(page).to have_text('Cidadão cadastrada com sucesso.')
    expect(page).to have_text('Cidadão 3')
  end


  scenario 'show citizen' do
    visit manager_citizen_path(Citizen.first)

    expect(page).to have_text('Cidadão 1')
  end

  scenario 'update citizen' do
    visit manager_citizen_path(Citizen.last)
    click_link I18n.t('views.manager.citizens.edit')

    fill_in 'Nome Completo', with: 'Cidadão 3'
    fill_in 'CEP', with: 'Rua 15 De Novembro'
    attach_file('citizen[photo]', 'spec/support/images/mulher-2.jpg')
    click_button I18n.t('views.manager.citizens.save')

    expect(page).to have_text('Cidadão atualizada com sucesso.')
    expect(page).to have_text('Cidadão 3')
  end

end
