#==============================================================================
# Watts
#
# @description: Module for providing functions to work with ScreenEditLine
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Screen edit line module (screen_edit_line.rb)

require_relative 'element.rb'

# Object definition
class ScreenEditLine < Element

  # Initializes the object.
  def initialize(app, font, heading)
    @heading_edited = heading.split('=')[0].strip
    super(app, "#{@heading_edited} screen", 'Edit line')
    @edit_line = @app.edit_line(:width => 500,
                                :font => font)
  end

  # Returns the string of characters which have been typed into the object.
  def text
    return @edit_line.text
  end
	
end
