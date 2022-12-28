module AresMUSH
  module Prefs
    def self.categories
      Global.read_config('prefs', 'categories') || []
    end
    
    def self.can_edit_prefs?(actor, model)
      return false if !actor
      return true if actor.name == model.name
      actor && actor.has_permission?("manage_prefs")
    end
    
    def self.uninstall_plugin
      Character.all.each do |c|
        c.update(rp_prefs: nil)
        c.update(prefs: nil)
        c.update(prefs_notes: nil)
      end
    end
  end
end