class CreateEntries < ActiveRecord::Migrations[5.2]
    def change 
        create_table :entries do |t|
            t.string :title 
            t.text   :content
        end
    end
end