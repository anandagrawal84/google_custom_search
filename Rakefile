require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require "spec"
require "spec/rake/spectask"

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the google_custom_search plugin.'
Spec::Rake::SpecTask.new(:test) do |t|
  plugin_root = File.dirname(__FILE__)
#  t.rcov = true
#  t.rcov_opts = lambda do
#    IO.readlines("#{plugin_root}/spec/rcov.opts").map {|l| l.chomp.split " "}.flatten
#  end
  t.spec_opts = ['--options', "\"#{plugin_root}/spec/spec.opts\""]
  t.spec_files = FileList[].include(File.join(plugin_root, 'spec', '**/*_spec.rb'))
end

desc 'Generate documentation for the google_custom_search plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'GoogleCustomSearch'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
