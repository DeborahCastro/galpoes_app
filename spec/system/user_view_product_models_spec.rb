require 'rails_helper'

describe 'Usuário vê modelos de produtos' do
  it 'a partir do menu' do
    # Arrange

    # Act
    visit root_path
    within('nav') do
      click_on 'Modelos de Produtos'
    end

    # Assert
    expect(current_path).to eq product_models_path
  end

  it 'com sucesso' do
    # Arrange
    supplier = Supplier.create!(brand_name: 'Samsung', 
                                corporate_name: 'Samsung Eletronics LTDA', 
                                registration_number: '8796579843650', 
                                full_address: 'Av Nacoes Unidas, 1000', 
                                city: 'São Paulo', 
                                state: 'SP', 
                                email: 'sac@samsumg.com.br')
   
    ProductModel.create!(name: 'TV 32', 
                        weight: 8000, 
                        width: 70, 
                        height: 45, 
                        depth: 10, 
                        sku: 'TV32-SAMSU-XPTO09090', 
                        supplier: supplier)

    ProductModel.create!(name:'SoundBar 7.1 Surround', 
                        weight: 3000, 
                        width: 80, 
                        height: 15, 
                        depth: 20, 
                        sku: 'SOU71-SAMSU-NOIZ7234',
                        supplier: supplier)
    
    # Act
      visit root_path
      within('nav') do
        click_on 'Modelos de Produtos'
      end

    # Assert
    expect(page).to have_content 'TV 32'
    expect(page).to have_content 'TV32-SAMSU-XPTO09090'
    expect(page).to have_content 'Samsung'
    expect(page).to have_content 'SoundBar 7.1 Surround'
    expect(page).to have_content 'SOU71-SAMSU-NOIZ7'
    expect(page).to have_content 'Samsung'
  end

  it 'e não existem produtos cadastrados' do
    # Arrange
    # Act
    visit root_path
    click_on 'Modelos de Produtos'
    # Assert
    expect(page).to have_content 'Nenhum modelo de produto cadastrado.'
  end
end