# frozen_string_literal: true

module Admin::ArticleHelper
  def resource_options
    Resource.all.map do |resource|
      file_name = resource.upload.file.file.split("/").last

      [file_name, resource.id]
    end
  end
end
