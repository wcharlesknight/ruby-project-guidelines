class CreateOffenses < ActiveRecord::Migration[5.2]
  def change
    create_table :offenses do |t|
      t.string :name 
      t.datetime :date
      t.string :neighborhood_name
      t.references :perpetrator
    end
  end
end
