# frozen_string_literal: true

require "rails_helper"

describe ArticlesController, type: :routing do
  describe "routing" do
    it "recognizes and generates #index" do
      expect(get: "/blog/").to route_to(controller: "articles", action: "index")
    end

    it "recognizes and generates #index with rss format" do
      expect(get: "/blog/articles.rss").
        to route_to(controller: "articles", action: "index", format: "rss")
    end

    it "recognizes and generates #index with atom format" do
      expect(get: "/blog/articles.atom").
        to route_to(controller: "articles", action: "index", format: "atom")
    end
  end

  describe "routing for #redirect action" do
    it "picks up any previously undefined path" do
      expect(get: "/blog/foobar").to route_to(controller: "articles",
                                         action: "redirect",
                                         from: "foobar")
    end

    it "matches paths with multiple components" do
      expect(get: "/blog/foo/bar/baz").to route_to(controller: "articles",
                                             action: "redirect",
                                             from: "foo/bar/baz")
    end

    it "handles permalinks with escaped spaces" do
      expect(get: "/blog/foo%20bar").to route_to(controller: "articles",
                                           action: "redirect",
                                           from: "foo bar")
    end

    it "handles permalinks with plus sign" do
      expect(get: "/blog/foo+bar").to route_to(controller: "articles",
                                         action: "redirect",
                                         from: "foo+bar")
    end

    it "routes URLs under /articles" do
      expect(get: "/blog/articles").to route_to(controller: "articles",
                                           action: "redirect",
                                           from: "articles")
      expect(get: "/blog/articles/foo").to route_to(controller: "articles",
                                               action: "redirect",
                                               from: "articles/foo")
      expect(get: "/blog/articles/foo/bar").to route_to(controller: "articles",
                                                   action: "redirect",
                                                   from: "articles/foo/bar")
      expect(get: "/blog/articles/foo/bar/baz").to route_to(controller: "articles",
                                                       action: "redirect",
                                                       from: "articles/foo/bar/baz")
    end
  end
end
