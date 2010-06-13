Spec::Matchers.define :move_anywhere_but do |moves|
  match do |piece|
    piece.field.elements.values.each do |e|
      if moves.include?(e)
        lambda {piece.move_to(e)}.should raise_error(Piece::InvalidMove, "#{e} is unreachable for #{piece.class} at #{piece.position}")
      else
        piece.move_to(e).position.should == e
      end
    end
    true
  end
end

