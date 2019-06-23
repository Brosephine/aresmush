module AresMUSH
  module Places
    class ChangePlaceRequestHandler
      def handle(request)
        scene = Scene[request.args[:scene_id]]
        enactor = request.enactor
        place_name = (request.args[:place_name] || "").titlecase
        
        if (!scene)
          return { error: t('webportal.not_found') }
        end
        
        error = Website.check_login(request)
        return error if error

        if (scene.room != enactor.room)
          return { error: t('places.cant_change_places_in_another_room') }
        end
        
        place = Places.find_place(enactor, place_name)
      
        if (place)
          scene.room.emit_ooc t('places.place_joined', :name => enactor.name, :place_name => place_name)
          enactor.update(place: place)
        else
          place = Place.create(name: place_name, room: enactor.room)
          enactor.update(place: place)
          scene.room.emit_ooc t('places.place_created', :name => enactor.name, :place_name => place_name)
        end
        
        
        
        {}
      end
    end
  end
end