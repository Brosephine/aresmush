module AresMUSH
  module Chargen
    def self.custom_approval(char)
      Custom.set_tags_and_chan(char)
    end
  end
end