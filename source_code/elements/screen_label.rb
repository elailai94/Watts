#==============================================================================
# Watts
#
# @description: Module for providing functions to work with ScreenLabel objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Screen label module (screen_label.rb)

require_relative 'element.rb'

# Object definition
class ScreenLabel < Element
  
  # Initializes the object.
  def initialize(app, font, heading, text)
    @heading_edited = heading.split('=')[0].strip
    super(app, "#{heading} screen", 'label')
    @app.para(text,
    	      :font => font,
    	      :size => 16,
    	      :stroke => @app.rgb(255, 255, 255))
  end
	
end
