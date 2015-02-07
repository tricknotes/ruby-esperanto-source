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
          estraverse.js
          vlq.js
          magic-string.js
          esperanto.browser.js
        ).map {|js| bundled_path_for(js) }
      end
    end
  end
end
