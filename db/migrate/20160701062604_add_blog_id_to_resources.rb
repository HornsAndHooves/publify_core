# frozen_string_literal: true

class AddBlogIdToResources < ActiveRecord::Migration[4.2]
  set_role "blog_content"

  class Blog < ActiveRecord::Base; end
  class Content < ActiveRecord::Base; end
  class Resource < ActiveRecord::Base; end

  def up
    add_column :resources, :blog_id, :integer

    if Resource.any?
      default_blog_id = Blog.order(:id).first.id
      Resource.find_each do |resource|
        content_id = resource.article_id
        blog_id = if content_id
                    Content.find(content_id).blog_id
                  else
                    default_blog_id
                  end
        resource.update_column(:blog_id, blog_id)
      end
    end

    change_column :resources, :blog_id, :integer, null: false
  end

  def down
    remove_column :resources, :blog_id
  end
end
