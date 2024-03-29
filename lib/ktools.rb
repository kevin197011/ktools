# frozen_string_literal: true

# Copyright (c) 2024 Kk
#
# This software is released under the MIT License.
# https://opensource.org/licenses/MIT

module Ktools
  class Error < StandardError; end
  # Your code goes here...
end

Dir.glob(File.join(File.dirname(__FILE__), 'ktools/*.rb')).each do |r|
  require_relative "ktools/#{File.basename(r, '.rb')}"
end
