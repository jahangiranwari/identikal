# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'identikal/version'

Gem::Specification.new do |spec|
  spec.name          = 'identikal'
  spec.version       = Identikal::VERSION
  spec.authors       = ['Jahangir Anwari']
  spec.email         = ['jahangir.rubygems@gmail.com']

  spec.summary       = 'Verify if two given PDF files are identical or not.'
  spec.description = <<-DESCRIPTION
    A no frills gem that does one thing and only one thing. Checks whether two given PDF files are identical or not.
    PDF comparison done in pure Ruby.
  DESCRIPTION
  spec.homepage      = 'https://github.com/jahangiranwari/identikal'
  spec.license       = 'MIT'

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org'
    spec.metadata['homepage_uri'] = spec.homepage
    spec.metadata['source_code_uri'] = spec.homepage
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      f.match(%r{^(test|spec|features)/})
    end
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.71.0'
  spec.add_dependency 'hexapdf', '~> 0.6.0'
  spec.add_dependency 'pdf-reader', '~> 2.2.0'
end
