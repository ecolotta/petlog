class CreateDogs < ActiveRecord::Migration[6.1]
  def change
    create_table :dogs do |t|
      t.string :name, null: false
      t.date :birthday, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
