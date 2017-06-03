$LOAD_PATH << File.expand_path('../lib', __FILE__)

require 'byebug'
require 'tempfile'
require 'minitest/autorun'
require 'middleman/gh_pages'

class Test < MiniTest::Test
  @@root = File.dirname(File.expand_path(__FILE__))

  class << self
    def root
      @@root
    end

    def test(name, &block)
      define_method("test_#{name}", &block)
    end
  end

  private

  def root
    self.class.root
  end

  def capture(stream)
    stream = stream.to_s
    captured_stream = Tempfile.new(stream)
    stream_io = eval("$#{stream}")
    origin_stream = stream_io.dup
    stream_io.reopen(captured_stream)

    yield

    stream_io.rewind
    return captured_stream.read
  ensure
    captured_stream.close
    captured_stream.unlink
    stream_io.reopen(origin_stream)
  end
end
