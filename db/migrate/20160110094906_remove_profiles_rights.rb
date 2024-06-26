# frozen_string_literal: true

class RemoveProfilesRights < ActiveRecord::Migration[4.2]
  set_role "blog_content"

  def up
    drop_table :profiles_rights
  end

  def down
    create_table :profiles_rights, id: false, schema: "blog_content" do |t|
      t.integer :profile_id
      t.integer :right_id
    end

    add_index :profiles_rights, [:profile_id]
  end
end
