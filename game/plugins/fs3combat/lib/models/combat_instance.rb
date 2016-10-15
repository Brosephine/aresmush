module AresMUSH
  
  class Combat < Ohm::Model
    include ObjectModel
      
    attribute :is_real, :type => DataType::Boolean
    attribute :turn_in_progress, :type => DataType::Boolean
    attribute :first_turn, :type => DataType::Boolean, :default => true
    
    reference :organizer, "AresMUSH::Character"
    collection :combatants, "AresMUSH::Combatant"
    collection :vehicles, "AresMUSH::Vehicle"

    before_delete :delete_objects
    
    def delete_objects
      combatants.each { |c| c.delete }
      vehicles.each { |v| v.delete }
    end
    
    def active_combatants
      combatants.select { |c| !c.is_noncombatant? }.sort_by{ |c| c.name }
    end
    
    def non_combatants
      combatants.select { |c| c.is_noncombatant? }.sort_by{ |c| c.name }
    end
    
    def is_real?
      is_real
    end
      
    def has_combatant?(name)
      !!find_combatant(name)
    end
      
    def find_combatant(name)
      Combatant.find_one_by_name(c.name).combine(combat_id: self.id).first
    end
   
    def find_vehicle_by_name(name)
      self.vehicles.find(name_upcase: name.upcase).first
    end

    def emit(message, npcmaster = nil)
      message = message + "#{npcmaster}"
      self.combatants.each { |c| c.emit(message)}
    end
      
    def emit_to_organizer(message, npcmaster = nil)
      message = message + " (#{npcmaster})" if npcmaster
        
      client = self.organizer.client
      if (client)
        client.emit t('fs3combat.organizer_emit', :message => message)
      end
    end
  end
end