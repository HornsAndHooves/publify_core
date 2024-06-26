# frozen_string_literal: true

class MoveLastConnectionToLastSignInAt < ActiveRecord::Migration[4.2]
  set_role "blog_content"

  class User < ActiveRecord::Base
  end

  def up
    User.find_each do |user|
      user.update_attribute(:last_sign_in_at, user.last_connection)
    end
  end

  def down
    User.find_each do |user|
      user.update_attribute(:last_connection, user.last_sign_in_at)
    end
  end
end
