class CreateUsers < ActiveRecord::Migrations[5.2]
    def change 
        create_table :users do |t|
            t.string :title 
           
        end
    end
end