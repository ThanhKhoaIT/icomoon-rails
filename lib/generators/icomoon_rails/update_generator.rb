require 'open-uri'
require 'fileutils'
require "rails/generators/base"

module IcomoonRails
  module Generators

    class UpdateGenerator < ::Rails::Generators::Base

      attr_reader :css_body, :css_path, :fonts_path

      def initializer
        url = @args.first
        @css_body = URI.open(url).read
        @css_path = 'app/assets/stylesheets/'
        @fonts_path = 'app/assets/fonts/'
      end

      def create_dir
        FileUtils.mkdir_p(css_path) unless File.directory?(css_path)
        FileUtils.mkdir_p(fonts_path) unless File.directory?(fonts_path)
      end

      def download_font_files
        files = css_body.scan(/(https\:\/\/i.icomoon.io\/public\/temp\/.*)\?/).map(&:first)

        files.each do |url|
          File.open("#{fonts_path}/#{File.basename(url)}", "wb") do |fo|
            fo.write URI.open(url).read
            puts "#{File.basename(url)} is updated"
          end
        end
      end

      def download_style_files
        cache_buster = ('a'..'z').to_a.shuffle.take(10).join
        File.open("#{css_path}/icons.css", "wb") do |fo|
          fo.write <<~END
            @font-face {
              font-family: 'icomoon';
              src: url('/assets/icomoon.eot?#{cache_buster}');
              src: url('/assets/icomoon.eot?#{cache_buster}#iefix') format('embedded-opentype'),
              url('/assets/icomoon.ttf?#{cache_buster}') format('truetype'),
              url('/assets/icomoon.woff?#{cache_buster}') format('woff'),
              url('/assets/icomoon.svg?#{cache_buster}#icomoon') format('svg');
              font-weight: normal;
              font-style: normal;
            }
          END
          fo.write css_body[css_body.index("}")+1..-1]
        end
        puts "Icons is updated"
      end

    end

  end
end
