require "minitest"
require "rack/mock"

require_relative "../../lib/rack/jekyll"

TEST_DIR   = File.expand_path("../../../test", __FILE__)
TEMP_DIR   = File.join(TEST_DIR, "tmp")
SOURCE_DIR = File.join(TEST_DIR, "source")
DEST_DIR   = File.join(TEMP_DIR, "_site")
