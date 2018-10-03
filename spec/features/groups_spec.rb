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
    visit root_path
    click_on 'Grupos'
    click_on 'Criar'
    fill_in 'Nome', with: grupo.name
    expect(page).to have_content("Grupo: #{grupo.name}")
  end
  scenario 'add user into the group' do
    visit root_path
  end
end