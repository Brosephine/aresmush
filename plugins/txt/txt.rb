$:.unshift File.dirname(__FILE__)

module AresMUSH
  module Telegram
    def self.plugin_dir
      File.dirname(__FILE__)
    end
 
    def self.shortcuts
      Global.read_config("telegram", "shortcuts")
    end
 
    def self.get_cmd_handler(client, cmd, enactor)
        case cmd.root
        when "telegram"
          case cmd.switch
          when "color"
            return TelegramColorCmd
          when "newscene"
            return TelegramNewSceneCmd
          when "reply"
            return TelegramReplyCmd
          when nil
            return TelegramSendCmd
          end
        end
      return nil
    end

    def self.get_web_request_handler(request)
      case request.cmd
      when "addTelegram"
        return AddTelegramRequestHandler
      end
      nil
    end
  end
end