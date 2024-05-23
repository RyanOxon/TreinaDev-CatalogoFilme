require 'rails_helper'

describe 'visitor authenticates as standard user' do
  it 'through navbar' do
    visit root_path

    within('nav') do
      click_on 'Login'
    end

    expect(page).to have_field 'E-mail'
    expect(page).to have_field 'Senha'
    expect(page).to have_button 'Log in'
    expect(page).to have_link 'Sign up'
    expect(page).to have_link 'Forgot your password?'
  end
  it 'and registers self' do
    visit root_path

    within('nav') do
      click_on 'Login'
    end

    click_on 'Sign up'

    fill_in 'E-mail', with: 'kanzaki@myself.com'
    fill_in 'Senha', with: 'password123'
    fill_in 'Confirme sua senha', with: 'password123'

    click_on 'Sign up'
  end
  it 'and logs in' do
    User.create!(email: 'kanzaki@myself.com', password: 'password123')

    visit root_path

    within('nav') do
      click_on 'Login'
    end

    fill_in 'E-mail', with: 'kanzaki@myself.com'
    fill_in 'Senha', with: 'password123'
    click_on 'Log in'

    within('nav') do
      expect(page).not_to have_content 'Login'
      expect(page).to have_content 'Logout'
    end
  end
  it 'and logs out' do
    User.create!(email: 'kanzaki@myself.com', password: 'password123')

    visit root_path

    within('nav') do
      click_on 'Login'
    end

    fill_in 'E-mail', with: 'kanzaki@myself.com'
    fill_in 'Senha', with: 'password123'
    click_on 'Log in'

    within('nav') do
      click_on 'Logout'
    end

    expect(page).to have_content 'Logout efetuado com sucesso.'
  end
end

