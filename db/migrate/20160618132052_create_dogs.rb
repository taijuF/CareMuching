class CreateDogs < ActiveRecord::Migration
  def change
    create_table :dogs do |t|
      t.string :image
      t.string :story
      t.string :location
      t.string :sex
      t.string :health
      t.string :title
      t.string :delivery_method
      t.string :castration
      t.string :can_single
      t.string :breed
      t.string :other
      t.string :age
      t.string :limit
      t.string :personality
      t.string :facility
      t.string :can_senior
      t.string :vaccine
      t.string :size

      t.timestamps null: false
    end
  end
end
