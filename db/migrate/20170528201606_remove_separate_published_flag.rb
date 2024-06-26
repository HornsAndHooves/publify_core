# frozen_string_literal: true

class RemoveSeparatePublishedFlag < ActiveRecord::Migration[5.0]
  set_role "blog_content"

  def change
    remove_column :contents, :published, :boolean, default: false
  end
end
