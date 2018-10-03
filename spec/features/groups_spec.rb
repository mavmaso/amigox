require 'rails_helper'

feature 'Adding a group' do
  scenario 'successfully' do
    grupo = build(:group)
    usuario = create(:user)
    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: usuario.email
    fill_in 'Password', with: usuario.password
    click_on 'Log in'
    click_on 'Grupos'
    click_on 'Criar'
    fill_in 'Nome', with: grupo.name
    click_on 'Enviar'
    expect(page).to have_content('Adicionado com sucesso')
    expect(page).to have_content(grupo.name)
  end

  scenario 'and add user into a group' do
    visit root_path
  end

  scenario 'and view all user in a group' do
    visit root_path
  end

  scenario 'and try to create a group with missing data' do
    visit root_path
  end

  scenario 'and try to create groups without a log in' do
    visit root_path
    click_on 'Grupos'
    click_on 'Criar'
    expect(page).to_not have_content('Nome: ')
    expect(page).to have_content('Log in')
  end

  scenario 'and edit a group`s name' do
    visit root_path
  end

  scenario 'and delete a group' do
    visit root_path
  end
end
