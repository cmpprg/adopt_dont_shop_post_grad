class AddDescriptionToPets < ActiveRecord::Migration[5.2]
  def change
    add_column :pets, :description, :text, limit: 10_000
  end
end
