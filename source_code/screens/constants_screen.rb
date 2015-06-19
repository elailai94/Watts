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
      image('../images/back_icon.png',
      	    :height => 50,
      	    :top => 15, :left => 15,
      	    :click => '/title_screen')
      title('Constants',
      	    :top => 4, :left => 80,
      	    :font => 'Segoe UI')
    end
    
    # Title screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:width => 15) do
      end
      # First content column 
      stack(:width => 532.5) do
        para('Speed of light in free space',
        	 :font => 'Segoe UI',
        	 :size => 16)
        para('3.00 x 10', sup('8'), ' ms', sup('-1'), :font => 'Segoe UI')
      end
      # Second content column
      stack(:width => 532.5) do
        para('Permeability of free space',
        	 :font => 'Segoe UI',
        	 :size => 16)
        para('4')
      end
    end
  end

end
