class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.timestamps null: false
    end
    %w(Metalmecánica
       Productos\ Elaborados
       Turismo
       Textiles\ y\ Calzado
       Alimentos\ Frescos\ e\ Industrializados
       Energías\ Renovables
       Biotecnología\ y\ Software
       Farmaceútica
       Servicios\ Logísticos
       Otros).each do |name|
         Category.create! name: name
    end
  end
end
