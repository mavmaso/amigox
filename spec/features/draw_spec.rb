require 'rails_helper'

feature 'Drawing for the secret santa' do
  scenario 'successfully' do
    grupo = create(:group)
    usuario = create(:user)
    convidado_1 = create(:user)
    convidado_2 = create(:user)
    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: usuario.email
    fill_in 'Password', with: usuario.password
    click_on 'Log in'
    click_on 'Grupos'
    click_on grupo.name
    click_on 'Sortear'
    expect(page).to have_content('Sorteio realizado com sucesso')
    expect(page).to have_content(grupo.name)

  end

  scenario 'and user view who get from the draw' do
    grupo = create(:group)
    usuario = create(:user)
    convidado = create(:user)
    join_user_group = create(:user_group, group: grupo, sender: usuario,
                             receiver: convidado)
    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: usuario.email
    fill_in 'Password', with: usuario.password
    click_on 'Log in'
    click_on 'Sorteio'
    expect(page).to have_content("Email do usuario: #{usuario.email}")
    expect(page).to have_content("Email do seu sorteado: #{convidado.email}")
  end
end