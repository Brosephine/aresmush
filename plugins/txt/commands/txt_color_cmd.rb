module AresMUSH
  module Telegram
    class TelegramColorCmd
      include CommandHandler
      
      attr_accessor :option
      
      def parse_args
        self.option = trim_arg(cmd.args)
      end

      def handle
        enactor.update(telegram_color: self.option)
        client.emit_success t('telegram.color_set', :option => self.option)
      end
    end
  end
end
