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
    expect(page).to have_content("Email do usuario: #{usuario.email}")
  end

  scenario 'and view all user in a group' do
    grupo_a = create(:group)
    grupo_b = create(:group)
    visit root_path
    click_on 'Grupos'
    expect(page).to have_content(grupo_a.name)
    expect(page).to have_content(grupo_b.name)
  end

  scenario 'and try to create a group with name in blank' do
    grupo = build(:group)
    usuario = create(:user)
    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: usuario.email
    fill_in 'Password', with: usuario.password
    click_on 'Log in'
    click_on 'Grupos'
    click_on 'Criar'
    fill_in 'Nome', with: ' '
    click_on 'Enviar'
    expect(page).to have_content('Não pode ser enviada')
    expect(page).to_not have_content(grupo.name)
    expect(page).to_not have_content("Email do usuario: #{usuario.email}")
  end

  scenario 'and try to create groups without a log in' do
    visit root_path
    click_on 'Grupos'
    click_on 'Criar'
    expect(page).to_not have_content('Nome: ')
    expect(page).to have_content('Log in')
  end

  scenario 'and edit a group`s name' do
    grupo = create(:group)
    usuario = create(:user)
    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: usuario.email
    fill_in 'Password', with: usuario.password
    click_on 'Log in'
    click_on 'Grupos'
  end

  scenario 'and delete a group' do
    grupo = create(:group)
    usuario = create(:user)
    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: usuario.email
    fill_in 'Password', with: usuario.password
    click_on 'Log in'
    click_on 'Grupos'
    click_on grupo.name
    click_on 'Apagar'
  end

  scenario 'and add user into a group' do
    grupo = create(:group)
    usuario = create(:user)
    convidado = create(:user)
    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: usuario.email
    fill_in 'Password', with: usuario.password
    click_on 'Log in'
    click_on 'Grupos'
    click_on grupo.name
    click_on 'Convidar'
    fill_in 'Convidado', with: convidado.email
    click_on 'Enviar'
    expect(page).to have_content('Adicionado com sucesso')
    expect(page).to have_content(grupo.name)
    expect(page).to have_content("Email do usuario: #{convidado.email}")
  end
end
