require 'esperanto/source/version'

module Esperanto
  module Source
    class << self
      def bundled_path_for(filename)
        File.expand_path("../../../vendor/#{filename}", __FILE__)
      end

      def bundled_paths
        %w(
          acorn.js
          base64.js
          esperanto.browser.js
        ).map {|js| bundled_path_for(js) }
      end

      def bundled_source
        'var window = this; ' + bundled_paths.map {|path| File.read(path) }.join
      end
    end
  end
end
