require 'rspec'
require 'date'
require 'simplecov'
SimpleCov.start
SimpleCov.add_filter ["spec"]

require_relative '../lib/enigma'
require_relative '../lib/key'
require_relative '../lib/offset'
