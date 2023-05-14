class AddFieldsToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :description, :text
    add_column :products, :rating, :float
    add_column :products, :spam_score, :integer
    add_column :products, :address, :string
  end
end
