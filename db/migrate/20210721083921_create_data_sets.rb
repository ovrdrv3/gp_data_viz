class CreateDataSets < ActiveRecord::Migration[6.1]
  def change
    create_table :data_sets do |t|
      
      t.text :'FIRST NAME'
      t.text :'MIDDLE INITIAL'
      t.text :'LAST NAME'
      t.text :'PREFIX'
      t.text :'ADDRESS 1'
      t.text :'ADDRESS 2'
      t.text :'CITY'
      t.text :'STATE'
      t.text :'ZIP CODE'
      t.text :'EDUCATION'
      t.text :'ESTIMATED INCOME'

      t.timestamps
    end
  end
end
