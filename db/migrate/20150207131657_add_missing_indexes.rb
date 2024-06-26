# frozen_string_literal: true

class AddMissingIndexes < ActiveRecord::Migration[4.2]
  set_role "blog_content"

  def change
    add_index :feedback, %i[id type]
    add_index :feedback, :user_id
    add_index :sidebars, %i[id type]
    add_index :contents, :user_id
    add_index :contents, %i[id type]
    add_index :articles_tags, :tag_id
    add_index :articles_tags, :article_id
    add_index :profiles_rights, :profile_id
    add_index :users, :profile_id
    add_index :users, :text_filter_id
    add_index :users, :resource_id
    add_index :triggers, %i[pending_item_id pending_item_type]
    add_index :redirections, :content_id
    add_index :redirections, :redirect_id
    add_index :resources, :article_id
  end
end
