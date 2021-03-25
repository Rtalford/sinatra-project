class CreateEntries < ActiveRecord::Migration[5.2]
    def change 
        create_table :entries do |t|
            t.string :title 
            t.text   :content
            t.integer :user_id
        end
    end
end