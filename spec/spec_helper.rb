# frozen_string_literal: true

require_relative "support/coverage"
require_relative "support/warnings"
require_relative "support/rspec_options"

begin
  require "pry-byebug"
rescue LoadError; end
require "dry-logic"
require "dry/core/constants"
require "pathname"

SPEC_ROOT = Pathname(__dir__)

Dir[SPEC_ROOT.join("shared/**/*.rb")].sort.each(&method(:require))
Dir[SPEC_ROOT.join("support/**/*.rb")].sort.each(&method(:require))

RSpec.configure do |config|
  config.include Module.new {
    def undefined
      Dry::Core::Constants::Undefined
    end
  }
end
