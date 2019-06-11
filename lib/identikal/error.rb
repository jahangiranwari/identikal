# frozen_string_literal: true

require 'identikal/compare'

module Identikal
  module Error
    class FileNotFound < ArgumentError
      def to_s
        'PDF file(s) could not be found. ' \
        'Please provide two PDF files to compare'
      end
    end

    class InvalidComparisonMethod < ArgumentError
      def to_s
        'Invalid comparision method. ' \
        'Please choose one of these methods: ' \
        "#{Identikal::Compare::COMPARE_METHODS}"
      end
    end
  end
end
