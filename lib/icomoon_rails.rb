module IcomoonRails
  class Engine < ::Rails::Engine
  end

  def self.setup
    yield self
  end

  mattr_accessor :class_prefix
  @@class_prefix = "icon"

  mattr_accessor :class_postfix
  @@class_prefix = ""
end

IcoMoonRails = IcomoonRails
