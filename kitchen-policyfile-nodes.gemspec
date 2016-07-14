# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kitchen/provisioner/policyfile_nodes_version'

Gem::Specification.new do |spec|
  spec.name          = 'kitchen-policyfile-nodes'
  spec.version       = Kitchen::Provisioner::POLICYFILE_NODES_VERSION
  spec.authors       = ['Andrei Skopenko']
  spec.email         = ['andrei@skopenko.net']
  spec.description   = 'Test Kitchen provisioner based on policyfile_zero that generates searchable nodes'
  spec.summary       = spec.description
  spec.homepage      = 'https://github.com/Parallels/kitchen-policyfile-nodes'
  spec.license       = 'Apache 2.0'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = []
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'test-kitchen', '~> 1.7.3'
  spec.add_dependency 'chef-dk', '~> 0.12'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 3.2'
  spec.add_development_dependency 'rubocop', '~> 0.37', '>= 0.37.1'
end
