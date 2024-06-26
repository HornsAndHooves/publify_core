# frozen_string_literal: true

class RemoveTextFilters < ActiveRecord::Migration[5.2]
  set_role "blog_content"

  def up
    drop_table :text_filters
  end

  def down
    create_table :text_filters, schema: "blog_content" do |t|
      t.string :name
      t.string :description
      t.string :markup
      t.text :filters
      t.text :params
    end
  end
end
