require 'rails_helper'

describe 'Usuário cadastra um fornecedor' do
  it 'a partir do menu' do
    # Arrange

    # Act
    visit root_path
    click_on 'Fornecedores'
    click_on 'Cadastrar novo fornecedor'

    # Assert
    expect(page).to have_content('Nome Fantasia')
    expect(page).to have_content('Razão Social')
    expect(page).to have_content('CNPJ')
    expect(page).to have_content('Endereço')
    expect(page).to have_content('Cidade')
    expect(page).to have_content('Estado')
    expect(page).to have_content('Email')
  end

  it 'com sucesso' do
    # Arrange

    # Act
    visit root_path
    click_on 'Fornecedores'
    click_on 'Cadastrar novo fornecedor'
    fill_in 'Nome Fantasia', with: 'Acme'
    fill_in 'Razão Social', with: 'ACME LTDA'
    fill_in 'CNPJ', with: '43542398796985'
    fill_in 'Endereço', with: 'Av das Palmas, 100'
    fill_in 'Cidade', with: 'Bauru'
    fill_in 'Estado', with: 'SP'
    fill_in 'Email', with: 'contato@acme.com'
    click_on 'Enviar'

      # Assert
    expect(page).to have_content('Fornecedor cadastrado com sucesso')
    expect(page).to have_content('ACME LTDA')
    expect(page).to have_content('Documento: 43542398796985')
    expect(page).to have_content('Endereço: Av das Palmas, 100 - Bauru - SP')
    expect(page).to have_content('Email: contato@acme.com')
  end


  it 'com dados incompletos' do
    # Arrange

    # Act
    visit root_path
    click_on 'Fornecedores'
    click_on 'Cadastrar novo fornecedor'
    fill_in 'Nome Fantasia', with: ''
    fill_in 'Razão Social', with: ''
    fill_in 'CNPJ', with: ''
    fill_in 'Endereço', with: ''
    fill_in 'Cidade', with: ''
    fill_in 'Estado', with: ''
    fill_in 'Email', with: ''
    click_on 'Enviar'

    # Assert
    expect(page).to have_content 'Fornecedor não cadastrado'
    expect(page).to have_content 'Nome Fantasia não pode ficar em branco'
    expect(page).to have_content 'Razão Social não pode ficar em branco'
    expect(page).to have_content 'CNPJ não pode ficar em branco'

  end
end