class RenameListingsNameColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column(:listings, :name, :title)
  end
end
