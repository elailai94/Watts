#==============================================================================
# Watts
#
# @description: Module for providing functions to work with ConstantsScreen objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Constants screen module (constants_screen.rb)

require_relative '../elements/screen_header.rb'

# Object definition
class ConstantsScreen < Shoes
  
  url('/title_screen/constants_screen', :constants_screen)

  # Draws the constants screen on the Shoes app window.
  def constants_screen
  	# Constants screen header
  	ScreenHeader.new(self, crimson, 'Constants')

    # Title screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      background(ghostwhite)
      # Left margin offset
      stack(:height => 640, :width => 80) do
      end
      # First content column 
      stack(:height => 640, :width => 500) do
        para('Speed of light in free space',
        	 :font => 'Segoe UI',
        	 :size => 16)
        para("3.00 x 10", sup("8"), " ms", sup("-1"),
        	 :font => "Segoe UI")
        para("Permittivity of free space",
        	 :font => "Segoe UI",
             :size => 16)
        para("8.85 x 10", sup("-12"), " Fm", sup("-1"),
        	 :font => "Segoe UI")
        para("Planck constant",
        	 :font => "Segoe UI",
        	 :size => 16)
        para("6.63 x 10", sup("-34"), " Js",
        	 :font => "Segoe UI")
      end
      # Second content column
      stack(:height => 640, :width => 500) do
        para("Permeability of free space",
        	 :font => "Segoe UI",
        	 :size => 16)
        para("4#{"\u03C0"} x 10", sup("-7"), " Hm", sup("-1"),
        	 :font => "Segoe UI")
        para("Elementary charge",
        	 :font => "Segoe UI",
        	 :size => 16)
        para("1.60 x 10", sup("-19"), " C", :font => "Segoe UI")
        para("Unified atomic mass unit",
        	 :font => "Segoe UI",
        	 :size => 16)
      end
    end
  end

end
