# frozen_string_literal: true

class AddBlogIdToTags < ActiveRecord::Migration[4.2]
  set_role "blog_content"

  class Tag < ActiveRecord::Base; end

  def up
    add_column :tags, :blog_id, :integer
    if Tag.any?
      default_blog_id = Blog.order(:id).first.id
      Tag.update_all("blog_id = #{default_blog_id}")
    end
  end

  def down
    remove_column :tags, :blog_id
  end
end
