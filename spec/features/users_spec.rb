require 'rails_helper'

feature 'User log in' do
  scenario 'successfully' do
    usuario = create(:user)
    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: usuario.email
    fill_in 'Password', with: usuario.password
    click_on 'Log in'
    expect(page).to have_content("Usuario: #{usuario.name}")
  end
end
