$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "case_study/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "case_study"
  s.version     = CaseStudy::VERSION
  s.authors     = ["Seb Ashton"]
  s.email       = ["seb@madebymade.co.uk"]
  s.homepage    = "http://www.madebymade.co.uk/"
  s.summary     = "Rails ActiveAdmin backed engine to add case studies to a website."
  s.description = "Case Study provides a models and active admin templates to your app."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.11"
  s.add_dependency "paperclip", "~> 3.0"
  s.add_dependency "stringex", "~> 1.5.1"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "database_cleaner"
end
