require 'rails_helper'

RSpec.describe ProductModel, type: :model do
  describe '#valid?' do
    it 'name is mandatory' do
      # Arrange
      supplier = Supplier.create!(brand_name: 'Samsung', corporate_name: 'Samsung Eletronics LTDA', registration_number: '8796579843509', full_address: 'Av Nacoes Unidas, 1000', city: 'São Paulo', state: 'SP', email: 'sac@samsumg.com.br')
  
      pm = ProductModel.new(name: '', weight:8000, height: 45, depth: 10, sku: 'TV32-SAMSU-XPTO090', supplier: supplier)
      
      # Act
      result = pm.valid?

      # Assert
      expect(result).to eq false
    end

    it 'sku is mandatory' do
      # Arrange
      supplier = Supplier.create!(brand_name: 'Samsung', 
                                  corporate_name: 'Samsung Eletronics LTDA', 
                                  registration_number: '8796579843650', 
                                  full_address: 'Av Nacoes Unidas, 1000', 
                                  city: 'São Paulo', 
                                  state: 'SP', 
                                  email: 'sac@samsumg.com.br')
      
      pm = ProductModel.new(name: 'TV32', 
                            weight: 8000, 
                            height: 45, 
                            depth: 10, 
                            sku: '', 
                            supplier: supplier)
      
      # Act
      result = pm.valid?
     
      # Assert
      expect(result).to eq false
    end

    it 'supplier is mandatory' do
      # Arrange
  
      pm = ProductModel.new(name: 'TV32', 
                            weight: 8000, 
                            height: 45, 
                            depth: 10, 
                            sku: 'TV32-SAMSU-XPTO090')
      
      # Act
      result = pm.valid?
     
      # Assert
      expect(result).to eq false
    end
  end
end
