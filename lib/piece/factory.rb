require 'piece/base'

module Piece
  class Factory

    # preload piece classes
    Dir[File.dirname(__FILE__) + '/pieces/*.rb'].each do |file|
      require file
    end

    def self.create(args = {})
      name = args.delete(:piece) or raise "Couldn't create piece: name must be provided"

      piece_class = eval('Piece::' + name.downcase.capitalize)
      piece_class.new(args)
    end

    private

    def initialize(*args)
    end
  end
end
