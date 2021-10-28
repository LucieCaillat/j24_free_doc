class RemoveColumDoctor < ActiveRecord::Migration[5.2]
  def change
    remove_column :doctors, :speciality, :string
    remove_column :doctors, :zip_code, :string
  end
end
