class ChangeYears < ActiveRecord::Migration
  def change
    change_column :images, :year, :string
  end
end
