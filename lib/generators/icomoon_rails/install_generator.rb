require "rails/generators/base"

module IcomoonRails
  module Generators

    class InstallGenerator < ::Rails::Generators::Base

      source_root File.expand_path("../templates", __FILE__)

      def copy_initializes
        template "icomoon.rb", "config/initializers/icomoon.rb"
      end

    end

  end
end
