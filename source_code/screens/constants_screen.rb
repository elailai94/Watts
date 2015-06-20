#==============================================================================
# Watts
#
# @description: Module for providing functions to work with ConstantsScreen objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Constants screen module (constants_screen.rb)

require_relative '../elements/screen_header.rb'
require 'elements/constants_screen_text'

# Object definition
class ConstantsScreen < Shoes
  
  url('/title_screen/constants_screen', :constants_screen)

  # Draws the constants screen on the Shoes app window.
  def constants_screen
    # Constants screen header
    @header = 'Constants'
    ScreenHeader.new(self, crimson, @header)

    # Constants screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:height => 720, :width => 80) do
      	background(ghostwhite)
      end
      # First content column 
      stack(:height => 720, :width => 500) do
      	background(ghostwhite)
      	para(' ', :size => 3)
        ConstantsScreenText.new(self, @header, 'Speed of light in free space')
        para('3.00 x 10', sup('8'), ' ms', sup('-1'),
             :font => 'Segoe UI')
        ConstantsScreenText.new(self, @header, 'Permittivity of free space')
        para('8.85 x 10', sup('-12'), ' Fm', sup('-1'),
             :font => 'Segoe UI')
        ConstantsScreenText.new(self, @header, 'Planck constant')
        para('6.63 x 10', sup('-34'), ' Js',
        	 :font => 'Segoe UI')
        ConstantsScreenText.new(self, @header, 'Rest mass of electron')
        para('9.11 x 10', sup('-31'), ' kg',
        	 :font => 'Segoe UI')
        ConstantsScreenText.new(self, @header, 'Rest mass of neutron')
        para('1.67 x 10', sup('-27'), ' kg',
        	 :font => 'Segoe UI')
        ConstantsScreenText.new(self, @header, 'Avogadro constant')
        para('6.02 x 10', sup('23'), ' mol', sup('-1'),
        	 :font => 'Segoe UI')
        ConstantsScreenText.new(self, @header, 'Stefan constant')
        para('5.67 x 10', sup('-8'), ' Wm', sup('-2'), 'K', sup('-4'),
        	 :font => 'Segoe UI')
        ConstantsScreenText.new(self, @header, 'Gravitational constant')
        para('6.67 x 10', sup('-11'), ' Nm', sup('2'), 'kg', sup('-2'),
        	 :font => 'Segoe UI')
      end
      # Second content column
      stack(:height => 720, :width => 500) do
      	background(ghostwhite)
      	para(' ', :size => 3)
      	ConstantsScreenText.new(self, @header, 'Permeability of free space')
        para("4#{"\u03C0"} x 10", sup('-7'), ' Hm', sup('-1'),
        	 :font => 'Segoe UI')
        ConstantsScreenText.new(self, @header, 'Elementary charge')
        para('1.60 x 10', sup('-19'), ' C',
        	 :font => 'Segoe UI')
        ConstantsScreenText.new(self, @header, 'Unified atomic mass unit')
        para('1.66 x 10', sup('-27'), ' kg',
        	 :font => 'Segoe UI')
        ConstantsScreenText.new(self, @header, 'Rest mass of proton')
        para('1.67 x 10', sup('-27'), ' kg',
        	 :font => 'Segoe UI')
        ConstantsScreenText.new(self, @header, 'Molar gas constant')
        para('8.31', ' JK', sup('-1'), 'mol', sup('-1'),
        	 :font => 'Segoe UI')
        ConstantsScreenText.new(self, @header, 'Boltzmann constant')
        para('1.38 x 10', sup('-23'), ' JK', sup('-1'),
        	 :font => 'Segoe UI')
        ConstantsScreenText.new(self, @header, 'Wien constant')
        para('2.9 x 10', sup('-3'), ' mK',
        	 :font => 'Segoe UI')
        ConstantsScreenText.new(self, @header, 'Acceleration of free fall')
        para('9.81', ' ms', sup('-2'),
        	 :font => 'Segoe UI')
      end
    end
  end

end
