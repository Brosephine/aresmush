module AresMUSH
  module Telegram
      class TelegramNewSceneCmd
        include CommandHandler

        attr_accessor :names, :names_raw, :message, :scene_id

    def parse_args
      if (!cmd.args)
        self.names = []
      else
        args = cmd.parse_args(ArgParser.arg1_equals_arg2)
        if (args.arg1 && (args.arg1.include?("http://") || args.arg1.include?("https://")) )
          self.names = []
        else
          self.names = list_arg(args.arg1)
          self.names_raw = trim_arg(args.arg1)
          self.message = trim_arg(args.arg2)
        end
      end
    end

    def check_approved
      return nil if enactor.is_approved?
      return t('dispatcher.not_allowed')
    end

    def check_telegram_target
      return t('telegram.telegram_new_scene_target_missing') if !self.names || self.names.empty?
      return nil
    end

    def handle

      self.names.each do |name|
        char = Character.named(name)
        if !char
          client.emit_failure t('telegram.no_such_character')
          return
        end
      end

      scene_type = Global.read_config("telegram", "scene_type")
      location = Global.read_config("telegram", "location")
      scene = Scenes.start_scene(enactor, location, true, scene_type, true)

      # Scenes.create_scene_temproom(scene)

      Global.logger.info "Scene #{scene.id} started by #{enactor.name} in Temp Telegram Room."

      # Checks if the names are valid. If so, starts a scene.
      Global.dispatcher.queue_command(client, Command.new("telegram #{self.names_raw}/#{scene.id}=#{self.message}"))

      self.names.each do |name|
        char = Character.named(name)
        if (!scene.participants.include?(char))
          Scenes.add_participant(scene, char, enactor)
        end
      end

    end
  end
  end
end
