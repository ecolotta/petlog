class CreateDogCares < ActiveRecord::Migration[6.1]
  def change
    create_table :dog_cares do |t|
      t.references :dog, null: false, foreign_key: true
      t.references :care_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
