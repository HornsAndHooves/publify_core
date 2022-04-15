# frozen_string_literal: true

class RemovePublishedAtFromFeedback < ActiveRecord::Migration[5.0]
  set_role "content"

  def change
    remove_column :feedback, :published_at, :datetime
  end
end
