# frozen_string_literal: true

$LOAD_PATH.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "publify_core/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "HornsAndHooves-publify_core"
  s.version     = PublifyCore::VERSION
  s.authors     = ["Matijs van Zuijlen", "Yannick François",
                   "Thomas Lecavellier", "Frédéric de Villamil"]
  s.email       = ["matijs@matijs.net"]
  s.homepage    = "https://publify.github.io/"
  s.summary     = "Core engine for the Publify blogging system."
  s.description = "Core engine for the Publify blogging system, formerly known as Typo."
  s.license     = "MIT"

  s.files       = File.open("Manifest.txt").readlines.map(&:chomp)

  s.required_ruby_version = ">= 2.4.0"

  s.add_dependency "aasm"
  s.add_dependency "akismet"
  s.add_dependency "bluecloth"
  s.add_dependency "cancancan"
  s.add_dependency "carrierwave"
  s.add_dependency "devise"
  s.add_dependency "devise-i18n"
  s.add_dependency "dynamic_form"
  s.add_dependency "fog-aws"
  s.add_dependency "fog-core"
  s.add_dependency "jquery-rails"
  s.add_dependency "jquery-ui-rails"
  s.add_dependency "kaminari"
  s.add_dependency "mimemagic"
  s.add_dependency "mini_magick"
  s.add_dependency "pg", "< 1.3.0"
  s.add_dependency "pg_saurus"
  s.add_dependency "rack"
  s.add_dependency "rails", "~> 6"
  s.add_dependency "rails-timeago"
  s.add_dependency "rails_autolink"
  s.add_dependency "recaptcha"
  s.add_dependency "RedCloth"
  s.add_dependency "rubypants"
  s.add_dependency "sassc-rails"
  s.add_dependency "sprockets"
  s.add_dependency "twitter"
  s.add_dependency "uuidtools"

  s.add_development_dependency "brakeman"
  s.add_development_dependency "capybara"
  s.add_development_dependency "factory_bot"
  s.add_development_dependency "feedjira"
  s.add_development_dependency "i18n-tasks"
  s.add_development_dependency "pry"
  s.add_development_dependency "rails-controller-testing"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "simplecov"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "timecop"
  s.add_development_dependency "webmock"
end
