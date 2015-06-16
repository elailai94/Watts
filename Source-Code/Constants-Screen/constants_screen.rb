#==============================================================================
# Watts
#
# @description: Module for providing functions to work with ConstantsScreen objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Constants screen module (constants_screen.rb)

# Object definition
class ConstantsScreen < Shoes
  
  url('/title_screen/constants_screen', :constants_screen)

  # Draws the constants screen on the Shoes app window.
  def constants_screen
  	background(ghostwhite)
  	# Constants screen heading
    flow(:height => 80, :width => 1080, :scroll => false) do
      title('Constants', :top => 23, :left => 60, :font => 'Segoe UI')
    end
  end
end
