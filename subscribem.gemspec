$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "subscribem/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "subscribem"
  s.version     = Subscribem::VERSION
  s.authors     = ["Mohammed Gharbi"]
  s.email       = ["mgharbik@gmail.com"]
  s.homepage    = "http://subscribem.io"
  s.summary     = "Subscribem."
  s.description = "Subscribem engine for authenticating multi-tenancy rails apps."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.2"
  s.add_dependency "bcrypt", "3.1.10"
  s.add_dependency "warden", "1.2.3"
  s.add_dependency "dynamic_form", "1.1.4"
  s.add_dependency "pg", "0.18.3"
  s.add_dependency "houser", "1.0.2"
  s.add_dependency "braintree", "2.40"

  s.add_development_dependency "rspec-rails", "3.3.2"
  s.add_development_dependency "capybara", "2.4.4"
  s.add_development_dependency "factory_girl", "4.4.0"
  s.add_development_dependency "database_cleaner", "1.5.1"
end
