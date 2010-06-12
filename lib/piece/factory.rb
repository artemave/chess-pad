require 'piece/base'

module Piece
  class Factory

    # preload piece classes
    Dir[File.dirname(__FILE__) + '/pieces/*.rb'].each do |file|
      require file
    end

    def self.create(name, opts)
      piece_class = eval('Piece::' + name.downcase.capitalize)
      piece_class.new(opts)
    end

    private

    def initialize(*args)
    end
  end
end
