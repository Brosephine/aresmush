module AresMUSH
    class Character
        attribute :telegram_last, :type => DataType::Array, :default => []
        attribute :telegram_last_scene, :type => DataType::Array, :default => []
        attribute :telegram_received
        attribute :telegram_received_scene
        attribute :telegram_color
        attribute :telegram_scene
    end
  end