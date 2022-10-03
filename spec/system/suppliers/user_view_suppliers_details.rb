require 'rails_helper'

describe 'Usuário vê fornecedores' do
  it 'a partir da tela inicial' do
    # Arrange
    Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME', registration_number: '43542398796985'),full_address: 'Av das Palmas, 100', city: 'Bauru', state: 'SP', email: 'contato@acme.com')
    
    # Act 
    visit root_path
    click_on 'Fornecedores'
    click_on 'ACME'

    # Assert
    expect(page).to have_content('ACME LTDA')
    expect(page).to have_content('Documento:43542398796985')
    expect(page).to have_content('Endereço: Av das Palmas, 100 - Bauru - SP')
    expect(page).to have_content('Email: contato@acme.com')
  end

  it 'e volta para a tela inicial' do
    # Arrange
    Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME', registration_number: '43542398796985'),full_address: 'Av das Palmas, 100', city: 'Bauru', state: 'SP', email: 'contato@acme.com')
    
    # Act
    visit root_path
    click_on 'Fornecedores'
    click_on 'ACME'
    click_on 'Voltar'
    
    expect(current_path).to eq root_path
  end
end