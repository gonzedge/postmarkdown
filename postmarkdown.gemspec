# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'postmarkdown/version'

Gem::Specification.new do |s|
  s.name        = 'postmarkdown'
  s.version     = Postmarkdown::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Jason Weathered', 'Nathanael Kane',  'Odin Dutton', 'Adrian Smith']
  s.email       = ['jason.weathered@ennova.com.au', 'nate.kane@ennova.com.au', 'odin.dutton@ennova.com.au', 'adrian.smith@ennova.com.au']
  s.licenses    = ['MIT']

  s.homepage    = ''
  s.summary     = %q{A simple Rails blog engine powered by markdown.}
  s.description = s.summary

  s.rubyforge_project = 'postmarkdown'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib', 'public']

  s.add_dependency 'rails'
  s.add_dependency 'rails3-generators'
  s.add_dependency 'haml'
  s.add_dependency 'gravtastic'
  s.add_dependency 'nokogiri'
  s.add_dependency 'redcarpet'
  s.add_dependency 'pygmentize'

  s.add_development_dependency 'appraisal'
  s.add_development_dependency 'combustion'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'delorean'
end
