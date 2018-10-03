require 'rails_helper'

feature 'User log in' do
  scenario 'successfully' do
    usuario = create(:user)
    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: usuario.email
    fill_in 'Password', with: usuario.password
    click_on 'Log in'
    expect(page).to have_content("Usuario: #{usuario.email}")
  end
  scenario 'and logout' do
    usuario = create(:user)
    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: usuario.email
    fill_in 'Password', with: usuario.password
    click_on 'Log in'
    click_on 'Sair'
    expect(page).to_not have_content("Usuario: #{usuario.email}")
    expect(page).to have_link('Entrar')
  end
  scenario 'and create an account' do
    usuario = build(:user)
    visit root_path
    click_on 'Entrar'
    click_on 'Sign up'
    fill_in 'Email', with: usuario.email
    fill_in 'Password *', with: usuario.password
    fill_in 'Password confirmation', with: usuario.password
    click_on 'Sign up'
    expect(page).to have_content("Usuario: #{usuario.email}")
  end
  scenario 'and try to create an account with missing data' do
    usuario = build(:user)
    visit root_path
    click_on 'Entrar'
    click_on 'Sign up'
    fill_in 'Email', with: 'invalidmail'
    fill_in 'Password *', with: '1234'
    fill_in 'Password confirmation', with: '1234'
    click_on 'Sign up'
    expect(page).to have_content('Please review the problems below')
    expect(page).to have_content('Email is invalid')
    expect(page).to have_content('Password is too short')
    expect(page).to_not have_content("Usuario: #{usuario.email}")
  end
end
