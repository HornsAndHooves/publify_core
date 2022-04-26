# frozen_string_literal: true

class RemoveExtraStateColumnsFromFeedback < ActiveRecord::Migration[5.0]
  set_role "blog_content"

  def change
    remove_column :feedback, :published, :boolean, default: false
    remove_column :feedback, :status_confirmed, :boolean
  end
end
