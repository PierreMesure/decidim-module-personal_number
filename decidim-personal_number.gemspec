# frozen_string_literal: true

$LOAD_PATH.push File.expand_path("lib", __dir__)

require "decidim/personal_number/version"

Gem::Specification.new do |s|
  s.version = Decidim::PersonalNumber.version
  s.authors = ["Pierre Mesure"]
  s.email = ["pierre.mesure@gmail.com"]
  s.license = "AGPL-3.0"
  s.homepage = "https://github.com/PierreMesure/decidim-module-personal_number"
  s.required_ruby_version = ">= 2.3.1"

  s.name = "decidim-personal_number"
  s.summary = "A decidim personal_number module"
  s.description = "Personal number support for decidim."

  s.files = Dir["{app,config,db,lib}/**/*", "LICENSE-AGPLv3.txt", "Rakefile", "README.md"]

  s.add_dependency "decidim-core"

  s.add_development_dependency "decidim-dev"
  s.add_development_dependency "decidim-admin"
end
