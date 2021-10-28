class AddAppointmentAttributs < ActiveRecord::Migration[5.2]
  def change
    change_table :appointments do |t|
      t.datetime :date
    end
  end
end
