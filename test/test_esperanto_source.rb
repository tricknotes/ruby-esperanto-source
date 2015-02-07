require 'minitest/autorun'
require 'minitest/power_assert'
require 'execjs'

require 'esperanto/source'

class TestEsperantoSource < MiniTest::Test
  def test_bundled_file
    assert { Esperanto::Source.bundled_path_for('esperanto.js') }
    assert { File.exist?(Esperanto::Source.bundled_path_for('esperanto.js')) }

    assert { Esperanto::Source.bundled_path_for('esperanto.browser.js') }
    assert { File.exist?(Esperanto::Source.bundled_path_for('esperanto.browser.js')) }
  end

  def test_bundled_paths
    assert { Esperanto::Source.bundled_paths.size > 0 }

    Esperanto::Source.bundled_paths.each do |path|
      assert { File.exist?(path) }
    end
  end

  def test_bundled_files_executable
    source = Esperanto::Source.bundled_paths.map {|path| File.read(path) }.join
    context = ExecJS::Runtimes::Node.compile(source) # Currently, other runtimes are not supported.

    assert { context.eval('typeof esperanto') == 'object' }
  end
end
