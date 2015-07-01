#==============================================================================
# Watts
#
# @description: Module for providing functions to work with ConstantsScreenText
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Constants screen text module (constants_screen_text.rb)

require_relative 'element.rb'

# Object definition
class ConstantsScreenText < Element

  # Initializes the object.
  def initialize(app, font, text)
    super(app, 'Constants Screen', 'Text')
    @app.para(text,
              :font => font,
              :size => 20,
              :stroke => @app.rgb(255, 255, 255))
  end
	
end
