module AresMUSH
  module Telegram
    class TelegramReplyCmd
      include CommandHandler

      attr_accessor :names, :names_raw, :message, :scene_id

      def parse_args
        self.message = cmd.args
      end

      def check_received_telegrams
        unless enactor.telegram_received
          client.emit_failure t('telegram.no_one_to_reply_to')
          return
        end
      end

      def handle
        if !self.message
          #Tell what the last telegram recieved was
          if enactor.telegram_received_scene
            client.emit_success t('telegram.reply_scene', :names => enactor.telegram_received, :scene => enactor.telegram_received_scene)
          else
            client.emit_success t('telegram.reply', :names => enactor.telegram_received )
          end
        elsif enactor.telegram_received_scene
          Global.dispatcher.queue_command(client, Command.new("telegram #{enactor.telegram_received}/#{enactor.telegram_received_scene}=#{self.message}"))
        else
          Global.dispatcher.queue_command(client, Command.new("telegram #{enactor.telegram_received}=#{self.message}"))
        end
      end

      def log_command
          # Don't log telegrams
      end

    end
  end
end
