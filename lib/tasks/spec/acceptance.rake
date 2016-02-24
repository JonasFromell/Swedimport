begin
  require 'rspec/core/rake_task'

  namespace :spec do
    desc 'Run acceptance specs'
    RSpec::Core::RakeTask.new(:acceptance) do |task|
      task.pattern = './spec/acceptance/**/*_spec.rb'
      task.rspec_opts = '--color --format doc --require ./spec/rails_helper.rb'
    end
  end

rescue LoadError => e
  desc 'Run acceptance specs'
  task 'spec:acceptance' do
    abort 'spec:acceptance rake task is not available.'
  end
end
