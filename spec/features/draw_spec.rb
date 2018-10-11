require 'rails_helper'

feature 'Drawing for the secret santa' do
  scenario 'successfully' do
    grupo = create(:group)
    usuario = create(:user)
    convidado = create(:user)
    create(:user_group, group: grupo, user: usuario)
    create(:user_group, group: grupo, user: convidado)
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
    expect(page).to have_content(usuario.email)
    expect(page).to have_content(convidado.email)
  end

  scenario 'and user view who get from the draw' do
    grupo = create(:group)
    usuario = create(:user)
    convidado = create(:user)
    create(:user_group, group: grupo, user: usuario)
    sorteio = create(:draw, group: grupo, sender: usuario, receiver: convidado)
    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: usuario.email
    fill_in 'Password', with: usuario.password
    click_on 'Log in'
    click_on 'Sorteios'
    click_on sorteio.group.name
    expect(page).to have_content("Email do usuario: #{usuario.email}")
    expect(page).to have_content("Email do seu sorteado: #{convidado.email}")
  end
end
