require 'test_helper'

module Middleman
  module GhPages
    class CommandTest < Test
      test "errors out on bad command outputs" do
        assert_raises Command::Error do
          Command.inexisting(:something)
        end
      end

      test "class methods are command factories" do
        Dir.chdir root do
          files = capture(:stdout) { Command.ls '-m' }.split(',').map(&:strip)

          assert_equal %w(gh_pages test_helper.rb), files
        end
      end

      test "instance methods invoke commands" do
        Dir.chdir root do
          ls = Command.ls

          files = capture(:stdout) { ls.gh_pages }.split(',').map(&:strip)

          assert_equal %w(command_test.rb), files
        end
      end
    end
  end
end
