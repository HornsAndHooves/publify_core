# frozen_string_literal: true

class AddBlogIdToRedirects < ActiveRecord::Migration[4.2]
  set_role "blog_content"

  class Redirect < ActiveRecord::Base; end

  def up
    add_column :redirects, :blog_id, :integer
    if Redirect.any?
      default_blog_id = Blog.order(:id).first.id
      Redirect.update_all("blog_id = #{default_blog_id}")
    end
  end

  def down
    remove_column :redirects, :blog_id
  end
end
