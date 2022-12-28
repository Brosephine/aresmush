module AresMUSH
  module Prefs
    class PrefsRequestHandler
      def handle(request)
        chars = Chargen.approved_chars
          .select { |c| !c.rp_prefs.blank? }
          .sort_by { |c| c.name }
          .map { |c| {
            name: c.name,
            icon: Website.icon_for_char(c),
            rp_prefs: Website.format_markdown_for_html( c.rp_prefs )
           }
        }
        
      end
    end
  end
end