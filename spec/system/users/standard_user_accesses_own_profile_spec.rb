require 'rails_helper'

describe 'standard user accesses own profile' do
  it 'through navbar' do
    julia = User.create!(email: 'kanzaki@myself.com', password: 'password123')
    UserProfile.create!(age: 20, name: 'Julia Kanzaki', country: 'Brasil', state: 'Paraná', city: 'Londrina', about: 'Sou uma pessoa bem bacana!', user: julia)

    login_as julia
    visit root_path

    click_on 'Meu Perfil'

    expect(page).to have_content 'Julia Kanzaki'
    expect(page).to have_content '20 anos'
    expect(page).to have_content 'Brasil'
     expect(page).to have_content 'Paraná'
    expect(page).to have_content 'Londrina'
    expect(page).to have_content 'Sou uma pessoa bem bacana!'
  end
end
