class CreateVariables < ActiveRecord::Migration
  def change
    create_table :variables do |t|
      t.references :route
      t.string :name
      t.text :path
    end
  end
end
