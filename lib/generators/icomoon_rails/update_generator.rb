require 'open-uri'
require 'fileutils'
require "rails/generators/base"

module IcomoonRails
  module Generators

    class UpdateGenerator < ::Rails::Generators::Base

      attr_reader :css_body, :assets_path

      def initializer
        url = @args.first
        @css_body = URI.open(url).read
        @assets_path = "vendor/assets/stylesheets/icomoon_rails"
      end

      def create_dir
        FileUtils.mkdir_p(assets_path) unless File.directory?(assets_path)
      end

      def download_font_files
        files = css_body.scan(/(https\:\/\/i.icomoon.io\/public\/temp\/.*)\?/).map(&:first)

        files.each do |url|
          File.open("#{assets_path}/#{File.basename(url)}", "wb") do |fo|
            fo.write URI.open(url).read
            puts "#{File.basename(url)} is updated"
          end
        end
      end

      def download_style_files
          fo.write <<~END
            @font-face {
              font-family: 'icomoon';
              src: url('/assets/icomoon_rails/icomoon.eot?5mo2a0');
              src: url('/assets/icomoon_rails/icomoon.eot?5mo2a0#iefix') format('embedded-opentype'),
              url('/assets/icomoon_rails/icomoon.ttf?5mo2a0') format('truetype'),
              url('/assets/icomoon_rails/icomoon.woff?5mo2a0') format('woff'),
              url('/assets/icomoon_rails/icomoon.svg?5mo2a0#icomoon') format('svg');
              font-weight: normal;
              font-style: normal;
            }
          END        
        File.open("#{assets_path}/icons.css", "wb") do |fo|
          fo.write css_body[css_body.index("}")+1..-1]
        end
        puts "Icons is updated"
      end

    end

  end
end
