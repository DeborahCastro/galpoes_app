require 'rails_helper'

describe 'Usuário edita um fornecedor' do
  it 'a partir da página do detalhes ' do
    user = User.create!(name: "João", email: 'joao@gmail.com', password: 'password')
    # Arrange
    s = Supplier.create!(corporate_name: 'ACME LTDA', 
                        brand_name: 'ACME', 
                        registration_number: '4354239879698',
                        full_address: 'Av das Palmas, 100', 
                        city: 'Bauru', 
                        state: 'SP', 
                        email: 'contato@acme.com')

    # Act
    login_as(user)
    visit root_path
    click_on 'Fornecedores'
    click_on 'ACME'
    click_on 'Editar'

    # Assert
    expect(page).to have_content 'Editar fornecedor'
    expect(page).to have_content('Razão Social')
    expect(page).to have_content('Nome Fantasia')
    expect(page).to have_content('CNPJ')
    expect(page).to have_content('Endereço')
    expect(page).to have_content('Cidade')
    expect(page).to have_content('Estado')
    expect(page).to have_content('Email')
  end

  it 'com sucesso' do
    user = User.create!(name: "João", email: 'joao@gmail.com', password: 'password')
    # Arrange
    s = Supplier.create!(corporate_name: 'ACME LTDA', 
      brand_name: 'ACME', 
      registration_number: '4354239879698',
      full_address: 'Av das Palmas, 100', 
      city: 'Bauru', 
      state: 'SP', 
      email: 'contato@acme.com')

    # Act
    login_as(user)
    visit root_path
    click_on 'Fornecedores'
    click_on 'ACME'
    click_on 'Editar'
    fill_in 'Nome Fantasia', with: 'INDUSTRIAS ACME'
    fill_in 'Endereço', with: 'Av das Palmas, 170'
    fill_in 'Email', with: 'contato@insdustriasacme.com'
    click_on 'Enviar'

    # Assert
    expect(page).to have_content 'Fornecedor atualizado com sucesso'
    expect(page).to have_content 'Fornecedor INDUSTRIAS ACME'
    expect(page).to have_content 'Endereço: Av das Palmas, 170' 
    expect(page).to have_content 'Email: contato@insdustriasacme.com'
  end
end
