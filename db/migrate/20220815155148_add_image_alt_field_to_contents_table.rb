class AddImageAltFieldToContentsTable < ActiveRecord::Migration[6.1]
  set_role "blog_content"

  def change
    add_column :contents, :image_alt, :string
  end
end
