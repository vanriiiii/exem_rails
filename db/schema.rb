ActiveRecord::Schema.define(version: 20181113132230) do

  enable_extension "plpgsql"

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.text "email"
    t.text "content"
  end

end
