class FixTableName < ActiveRecord::Migration
    def change
        rename_table :microposts, :reviews
    end
end
