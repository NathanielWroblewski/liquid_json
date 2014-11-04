class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.text :route_id
      t.text :markdown
      t.text :liquid
      t.text :json_url
    end

    add_index :routes, :route_id
  end
end
