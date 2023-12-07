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
    click_button I18n.t('views.manager.citizens.save')

    expect(page).to have_text('Cidadão atualizada com sucesso.')
    expect(page).to have_text('Cidadão 3')
  end

end
