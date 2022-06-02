# frozen_string_literal: true

require "rails_helper"

describe Resource, type: :model do
  describe "#upload" do
    let(:blog) { create :blog }
    let(:resource) { create :resource, blog: blog }
    let(:img_resource) do
      described_class.create blog: blog,
                             upload: file_upload("testfile.png", "image/png")
    end

    it "stores files in the correct location" do
      expected_path = Rails.root.join("public", "files/resource/#{resource.to_param}", "testfile.txt")
      expect(resource.upload.file.file).to eq expected_path.to_s
    end

    it "stores resized images in the correct location" do
      thumb_path = Rails.root.join("public", "files/resource/#{img_resource.to_param}", "thumb_testfile.png")
      expect(img_resource.upload.thumb.file.file).to eq thumb_path.to_s
    end

    it "creates three image versions" do
      expect(img_resource.upload.versions.keys).to match_array [:thumb, :medium, :avatar]
    end

    it "gives the correct url for the attachment" do
      expect(resource.upload_url).to eq "/files/resource/#{resource.to_param}/testfile.txt"
    end

    it "gives the correct url for the image versions" do
      expect(img_resource.upload_url(:thumb)).to eq "/files/resource/#{img_resource.to_param}/thumb_testfile.png"
    end
  end
end
