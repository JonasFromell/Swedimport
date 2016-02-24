begin
  namespace :spec do
    desc 'Run unit specs'
    RSpec::Core::RakeTask.new(:unit) do |task|
      task.pattern = './spec/unit/**/*_spec.rb'
      task.rspec_opts = '--color --format doc --require ./spec/spec_helper.rb'
    end
  end

rescue LoadError => e
  desc 'Run unit tests'
  task 'spec:unit' do
    abort 'spec:unit rake task is not available.'
  end
end
