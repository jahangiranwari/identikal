# frozen_string_literal: true

require 'identikal/version'
require 'identikal/compare'

module Identikal
  class << self
    def files_same?(*args)
      Identikal::Compare.files_same?(*args)
    end
  end
end
