ActiveRecord::Schema.define(versions: 2021_01_28_220528) development do

    create_table "users", force: :cascade do |t|
       t.string "name"
    end

    create_table "entries", force: :cascade do |t|
        t.string "title"
        t.text "content"
        t.integer "user_id"   #added manually
        #t.belongs_to :user
    end 


end