require 'rails_helper'

RSpec.describe Supplier, type: :model do
  describe '#valid?' do
    it 'CNPJ is unique' do
      # Arrange
      supplier = Supplier.create!(brand_name: 'Samsung', 
                                  corporate_name: 'Samsung Eletronics LTDA', 
                                  registration_number: '8796579843609', 
                                  full_address: 'Av Nacoes Unidas, 1000', 
                                  city: 'São Paulo', 
                                  state: 'SP', 
                                  email: 'sac@samsumg.com.br')

      s = Supplier.new(brand_name: 'LeNovo', 
                       corporate_name: 'LeNovo Eletronics LTDA', 
                       registration_number: '8796579843609', 
                       full_address: 'Av Camarao, 1060', 
                       city: 'São Paulo', 
                       state: 'SP', 
                       email: 'sac@lenovo.com.br')      

      # Act
      result = s.valid?

      # Assert
      expect(result).to eq false
                            
    end

    it 'CNPJ is 13 digits long' do
      # Arrange
      s_14 = Supplier.new(brand_name: 'Samsung', 
                          corporate_name: 'Samsung Eletronics LTDA', 
                          registration_number: '87965798436509', 
                          full_address: 'Av Nacoes Unidas, 1000', 
                          city: 'São Paulo', 
                          state: 'SP', 
                          email: 'sac@samsumg.com.br')

      s_12 = Supplier.new(brand_name: 'LeNovo', 
                          corporate_name: 'LeNovo Eletronics LTDA', 
                          registration_number: '879657984365', 
                          full_address: 'Av Camarao, 1060', 
                          city: 'São Paulo', 
                          state: 'SP', 
                          email: 'sac@lenovo.com.br')            

      s_13 = Supplier.new(brand_name: 'JBL', 
                          corporate_name: 'JBL Eletronics LTDA', 
                          registration_number: '8796579843659', 
                          full_address: 'Av Pastel, 1090', 
                          city: 'Roraima', 
                          state: 'RO', 
                          email: 'sac@jbl.com.br')      

      # Act
      result_14 = s_14.valid?

      result_12 = s_12.valid?

      result_13 = s_13.valid?


      # Assert
      expect(result_14).to eq false
      expect(result_12).to eq false
      expect(result_13).to eq true

    end

    it 'brand name is mandatory' do
      # Arrange
      s = Supplier.new(brand_name: '', 
        corporate_name: 'LeNovo Eletronics LTDA', 
        registration_number: '8796579843609', 
        full_address: 'Av Camarao, 1060', 
        city: 'São Paulo', 
        state: 'SP', 
        email: 'sac@lenovo.com.br')      

      # Act
      result = s.valid?

      # Assert
      expect(result).to eq false

    end

    it 'corporate name is mandatory' do
      # Arrange
      s = Supplier.new(brand_name: 'LeNovo', 
        corporate_name: '', 
        registration_number: '8796579843609', 
        full_address: 'Av Camarao, 1060', 
        city: 'São Paulo', 
        state: 'SP', 
        email: 'sac@lenovo.com.br')      

      # Act
      result = s.valid?

      # Assert
      expect(result).to eq false
    end

    it 'email is mandatory' do
      # Arrange
      s = Supplier.new(brand_name: 'LeNovo', 
        corporate_name: 'LeNovo Eletronics LTDA', 
        registration_number: '8796579843609', 
        full_address: 'Av Camarao, 1060', 
        city: 'São Paulo', 
        state: 'SP', 
        email: '')      

      # Act
      result = s.valid?

      # Assert
      expect(result).to eq false
    end
  end
end
