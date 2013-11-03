require 'forwardable'

require 'request'
require 'version'


module Data
  class << self
    extend Forwardable

    def_delegator 'Vacuum::Request', :new
  end
end
