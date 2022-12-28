module AresMUSH
  module Traits
    class RemoveTraitCmd
      include CommandHandler
                
      attr_accessor :name, :trait_name
            
      def parse_args
        if (Chargen.can_approve?(enactor) && cmd.args =~ /.+=.+/)
          args = cmd.parse_args(ArgParser.arg1_equals_arg2)
          
          self.name = titlecase_arg(args.arg1)
          self.trait_name = titlecase_arg(args.arg2)
        else
          self.name = enactor_name
          self.trait_name = titlecase_arg(cmd.args)
        end
      end
      
      def required_args
        [ self.name, self.trait_name ]
      end
      
      def handle
        ClassTargetFinder.with_a_character(self.name, client, enactor) do |model|
          if (!Traits.can_edit_traits?(enactor, model))
            client.emit_failure t('dispatcher.not_allowed')
            return
          end
          
          error = Traits.check_traits_locked(enactor, model)
          if (error)
            client.emit_failure error
            return
          end
          
          traits = model.traits || {}
          traits.delete self.trait_name
          model.update(traits: traits)
          client.emit_success t('traits.trait_removed')
        end
      end
    end
  end
end
