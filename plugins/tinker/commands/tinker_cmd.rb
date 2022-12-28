module AresMUSH
  module Tinker
    class TinkerCmd
      include CommandHandler
      
      def check_can_manage
        return t('dispatcher.not_allowed') if !enactor.has_permission?("tinker")
        return nil
      end
      
      def handle
         FS3ActionSkill.all.each do |a|
           if (a.name == 'Piloting')
             client.emit "Deleting Piloting from #{a.character.name} -- was at rating #{a.rating}."
               a.delete
             end
         end
      end
    end
  end
end
