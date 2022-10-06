require 'rails_helper'

RSpec.describe ProductModel, type: :model do
  describe '#valid?' do
    it 'name is mandatory' do
      # Arrange
      supplier = Supplier.create!(brand_name: 'Samsung', 
                                  corporate_name: 'Samsung Eletronics LTDA', 
                                  registration_number: '8796579843509', 
                                  full_address: 'Av Nacoes Unidas, 1000', 
                                  city: 'São Paulo', 
                                  state: 'SP', 
                                  email: 'sac@samsumg.com.br')
  
      pm = ProductModel.new(name: '', 
        weight:8000, 
        height: 45, 
        depth: 10, 
        sku: 'TV32-SAMSU-XPTO090', 
        supplier: supplier)
      
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

    it 'sku have 20 digits' do
      # Arrange
      supplier = Supplier.new(brand_name: 'Samsung', 
                          corporate_name: 'Samsung Eletronics LTDA', 
                          registration_number: '8796579843650', 
                          full_address: 'Av Nacoes Unidas, 1000', 
                          city: 'São Paulo', 
                          state: 'SP', 
                          email: 'sac@samsumg.com.br')

      pm_21 = ProductModel.new(name: 'TV32', 
        weight: 8000, 
        height: 45, 
        depth: 10, 
        sku: 'TV32-SAMSU-XPTO090909', 
        supplier: supplier)
      
      pm_20 = ProductModel.new(name: 'TV36', 
          weight: 8000, 
          height: 45, 
          depth: 10, 
          sku: 'TV32-SAMSU-XPTO09090', 
          supplier: supplier)
          
      pm_19 = ProductModel.new(name: 'TV40', 
            weight: 8000, 
            height: 45, 
            depth: 10, 
            sku: 'TV32-SAMSU-XPTO0909',
            supplier: supplier)
     
      # Act
      result_21 = pm_21.valid?

      result_20 = pm_20.valid?

      result_19 = pm_19.valid?


        # Assert
      expect(result_21).to eq false
      expect(result_19).to eq false
      expect(result_20).to eq true
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