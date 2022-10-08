require 'rails_helper'

describe 'Usuário vê fornecedores' do
  it 'a partir da tela inicial' do
    # Arrange
    Supplier.create!(corporate_name: 'ACME LTDA', 
                    brand_name: 'ACME', 
                    registration_number: '4354239879698',
                    full_address: 'Av das Palmas, 100', 
                    city: 'Bauru', 
                    state: 'SP', 
                    email: 'contato@acme.com')
    
    # Act 
    visit root_path
    click_on 'Fornecedores'
    click_on 'ACME'

    # Assert
    expect(page).to have_content('ACME LTDA')
    expect(page).to have_content('Documento: 4354239879698')
    expect(page).to have_content('Endereço: Av das Palmas, 100 - Bauru - SP')
    expect(page).to have_content('Email: contato@acme.com')
  end

  it 'e volta para a tela inicial' do
    # Arrange
    Supplier.create!(corporate_name: 'ACME LTDA', 
                    brand_name: 'ACME', 
                    registration_number: '4354239879698',
                    full_address: 'Av das Palmas, 100', 
                    city: 'Bauru', 
                    state: 'SP', 
                    email: 'contato@acme.com')
    
    # Act
    visit root_path
    click_on 'Fornecedores'
    click_on 'ACME'
    click_on 'Voltar'
    
    expect(current_path).to eq root_path
  end
  
  it 'vê modelos de produtos na página de fornecedores' do
    # Arrange
    s = Supplier.create!(corporate_name: 'ACME LTDA', 
                    brand_name: 'ACME', 
                    registration_number: '4354239879698',
                    full_address: 'Av das Palmas, 100', 
                    city: 'Bauru', 
                    state: 'SP', 
                    email: 'contato@acme.com')

    pm = ProductModel.create!(name: 'TV 32', 
                      weight: 8000, 
                      width: 60,
                      height: 45, 
                      depth: 10, 
                      sku: 'TV32-SAMSU-XPTO09090', 
                      supplier: s)
    
    # Act 
    visit root_path
    click_on 'Fornecedores'
    click_on 'ACME'

    # Assert
    expect(page).to have_content('TV 32')
    expect(page).to have_content('Peso: 8000 g')
    expect(page).to have_content('Dimensões: 60 cm x 45 cm x 10 cm')
    expect(page).to have_content('SKU: TV32-SAMSU-XPTO09090')
  end
end