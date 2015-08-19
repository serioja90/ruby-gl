# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruby/gl/version'

Gem::Specification.new do |spec|
  spec.name          = "ruby-gl"
  spec.version       = Ruby::GL::VERSION
  spec.authors       = ["Groza Sergiu"]
  spec.email         = ["serioja90@gmail.com"]
  spec.summary       = %q{A Ruby library for 3D applications}
  spec.description   = %q{Ruby::GL is a library that allows you to build powerfull 3D applications in Ruby.
                          Ruby::GL relies on OpenGL, GLU and GLUT libraries, so that the rendering operations are
                          very fast.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10"
  spec.add_runtime_dependency "celluloid", "~> 0.17"
  spec.add_runtime_dependency "glu", "~> 8.2"
  spec.add_runtime_dependency "glut", "~> 8.2"
  spec.add_runtime_dependency "ffi", "~> 1.9"
  spec.add_runtime_dependency "thread_safe", "~> 0.3"
end
