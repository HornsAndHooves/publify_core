# frozen_string_literal: true

class DemandBlogIdOnContents < ActiveRecord::Migration[4.2]
  set_role "blog_content"

  def up
    change_column :contents, :blog_id, :integer, null: false
  end

  def down
    change_column :contents, :blog_id, :integer, null: true
  end
end
