require 'rom'

Swedimport::Container.namespace(:persistance) do |container|
  # Configure ROM
  config = ROM::Configuration.new(:mongo, 'mongodb://127.0.0.1:27017/swedimport')

  # Register ROM configuration
  container.finalize(:rom) do
    # Auto register relations
    config.auto_registration(container.root.join('lib/persistance'))

    container.register('rom', ROM.container(config))
  end
end
