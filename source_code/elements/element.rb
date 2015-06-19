#==============================================================================
# Watts
#
# @description: Module for providing functions to work with Element objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Element module (element.rb)

# Object definition
class Element
  
  # Initializes the object.
  def initialize(app, screen, type)
    @app = app
    @screen = screen
    @type = type
  end

  # Returns a string representation of the object.
  # @return [String]
  def to_s
    return "#{@screen} #{@type}"
  end

end
