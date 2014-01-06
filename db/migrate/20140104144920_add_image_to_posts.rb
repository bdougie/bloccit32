class AddImageToPosts < ActiveRecord::Migration
  def change
    add_column :post :image, :string
  end
end
