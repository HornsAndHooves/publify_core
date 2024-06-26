# frozen_string_literal: true

class MoveResourcesToContent < ActiveRecord::Migration[5.0]
  set_role "blog_content"

  def change
    rename_column :resources, :article_id, :content_id
  end
end
