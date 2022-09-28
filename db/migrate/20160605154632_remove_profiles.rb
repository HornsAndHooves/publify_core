# frozen_string_literal: true

class RemoveProfiles < ActiveRecord::Migration[4.2]
  set_role "blog_content"

  class Profile < ActiveRecord::Base
    serialize :modules
  end

  def up
    drop_table :profiles
  end

  def down
    create_table :profiles, schema: "blog_content" do |t|
      t.string :label
      t.string :nicename
      t.text   :modules
    end

    Profile.create!(label: "admin", nicename: "Publify administrator",
                    modules: %i[dashboard articles notes pages feedback
                                media themes sidebar profile users
                                settings seo])
    Profile.create!(label: "publisher", nicename: "Blog publisher",
                    modules: %i[dashboard articles notes pages feedback
                                media profile])
    Profile.create!(label: "contributor", nicename: "Contributor",
                    modules: %i[dashboard profile])
  end
end
