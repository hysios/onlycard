# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
	include Onlycard::I18n
	
	def dynamic_effect( target, name, *args )
		content_tag :script, :type => 'text/javascript' do 
			visual_effect name, target , *args
		end
	end
end
