require 'rails_helper'

describe 'standard user completes profile registration' do
  it 'after signing up' do
    visit root_path

    within('nav') do
      click_on 'Login'
    end

    click_on 'Sign up'

    fill_in 'E-mail', with: 'kanzaki@myself.com'
    fill_in 'Senha', with: 'password123'
    fill_in 'Confirme sua senha', with: 'password123'

    click_on 'Sign up'

    expect(current_path).to eq new_user_profile_path

    expect(page).to have_content 'Para finalizar seu cadastro, preencha os dados abaixo.'
  end
  it 'and fills in all fields' do
    julia = User.create!(email: 'kanzaki@myself.com', password: 'password123')
    login_as julia
    visit new_user_profile_path

    fill_in 'Idade', with: 20
    fill_in 'Nome', with: 'Julia Kanzaki'
    fill_in 'País', with: 'Brasil'
    fill_in 'Estado', with: 'Paraná'
    fill_in 'Cidade', with: 'Londrina'
    fill_in 'Sobre mim', with: 'Sou uma pessoa bem bacana!'

    click_on 'Enviar'

    expect(page).to have_content 'Perfil cadastrado com sucesso!'
    expect(page).to have_content 'Julia Kanzaki'
    expect(page).to have_content '20 anos'
    expect(page).to have_content 'Brasil'
    expect(page).to have_content 'Paraná'
    expect(page).to have_content 'Londrina'
    expect(page).to have_content 'Sou uma pessoa bem bacana!'
  end
end
