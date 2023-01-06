module AresMUSH
    module Custom
  
       def self.my_titlecase(str)
         return str.titlecase.gsub(/\b([A-Z]')([a-z])/) { $1 + $2.capitalize }
       end
   
       def self.set_tags_and_chan(char)
   
          faction = char.group("family")
          role = Role.find_one_by_name(family)
   
          if (role)
            char.roles.add role
          end
   
          # auto-tagging the char page
          tag_list = []
          tag_list.push(family)
          if ((family != "NPC"))
             house = char.group("house")
             house_tag =self.salon_tag(house)
             tag_list.push(house_tag)
          end
          # ^^ tags for houses are tackled in a function (salons, etc)
        
          # adding home country tag for magic: 
          magic = char.group("magic")
          if (country != "Incorporeal")
             country_tag =self.magic_tag(magic)
             tag_list.push(magic_tag)
          end
        
         tags = (tag_list || []).map { |t| t.downcase }.select { |t| !t.blank? }
          
         Website.update_tags(char, tags)
         
         # auto-joining to the faction channel
         c = []
         c.push(self.standard_channel(char))
         Channels.add_to_channels(nil, char, c)     
      end
   
     end
   end