begin
  namespace :spec do
    desc 'Run integration specs'
    RSpec::Core::RakeTask.new(:integration) do |task|
      task.pattern = './spec/integration/**/*_spec.rb'
      task.rspec_opts = '--color --format doc --require ./spec/spec_helper.rb'
    end
  end

rescue LoadError => e
  desc 'Run integration specs'
  task 'spec:integration' do
    abort 'spec:integration rake task is not available.'
  end
end
