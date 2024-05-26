require 'rails_helper'

describe 'standard user edits profile' do
  it 'successfully' do
    julia = User.create!(email: 'kanzaki@myself.com', password: 'password123')
    UserProfile.create!(age: 20, name: 'Julia Kanzaki', country: 'Brasil', state: 'Paraná', city: 'Londrina', about: 'Sou uma pessoa bem bacana!', user: julia)

    login_as julia
    visit root_path

    click_on 'Meu Perfil'
    click_on 'Editar'

    fill_in 'Nome', with: 'Julia Suemi Kanzaki'
    fill_in 'Idade', with: 21

    click_on 'Enviar'

    expect(page).to have_content 'Perfil atualizado com sucesso!'
    expect(page).to have_content 'Julia Suemi Kanzaki'
    expect(page).to have_content 21
  end
  it 'and does not fill all mandatory fields' do
    julia = User.create!(email: 'kanzaki@myself.com', password: 'password123')
    UserProfile.create!(age: 20, name: 'Julia Kanzaki', country: 'Brasil', state: 'Paraná', city: 'Londrina', about: 'Sou uma pessoa bem bacana!', user: julia)

    login_as julia
    visit root_path

    click_on 'Meu Perfil'
    click_on 'Editar'

    fill_in 'Nome', with: nil
    fill_in 'Idade', with: 21

    click_on 'Enviar'

    expect(page).to have_content 'Nome não pode ficar em branco'
  end
end
