class AddPatientAttributs < ActiveRecord::Migration[5.2]
  def change
    change_table :patients do |t|
      t.string :first_name
      t.string :last_name
    end
  end
end