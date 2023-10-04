# frozen_string_literal: true

require 'singleton'

class NoPiece
  include Singleton

  def to_s
    print '   '
  end

  def color
  end
end
