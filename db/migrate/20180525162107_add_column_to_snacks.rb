class AddColumnToSnacks < ActiveRecord::Migration[5.1]
  def change
    add_column :snacks, :price, :integer
  end
end
