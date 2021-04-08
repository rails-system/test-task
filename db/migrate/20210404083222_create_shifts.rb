class CreateShifts < ActiveRecord::Migration[5.2]
  def change
    create_table :shifts do |t|
      t.references :user

      t.time :from
      t.time :to
      t.integer :day
      t.timestamps
    end
  end
end
