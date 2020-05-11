class CreateAnagrams < ActiveRecord::Migration[5.2]
  def change
    create_table :anagrams do |t|
      t.string :word1
      t.string :word2
      t.boolean :result

      t.timestamps
    end
  end
end
