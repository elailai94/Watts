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

  url('/title_screen/constants_screen',
      :constants_screen)

  # Draws the constants screen on the Shoes app window.
  def constants_screen
    @heading = 'Constants'
    background("../images/#{@heading.downcase.gsub(' ','_')}_large.png")

    # Constants screen header
    ScreenHeader.new(self, '/title_screen', @@font, @heading)

    # Constants screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      @constants_screen_tagline_styles = {:font => @@font,
      	                                  :size => 16,
      	                                  :stroke => rgb(255, 255, 255)}
      # Left margin offset
      stack(:height => 850, :width => 80)
      # First content column
      stack(:height => 850, :width => 500) do
        ConstantsScreenText.new(self, @@font, 'Speed of light in free space')
        @speed_of_light = para('3.00 x 10', sup('8'), ' ms', sup('-1'))
        @speed_of_light.style(@constants_screen_tagline_styles)

        ConstantsScreenText.new(self, @@font, 'Permittivity of free space')
        @free_space_permittivity = para('8.85 x 10', sup('-12'), ' Fm', sup('-1'))
        @free_space_permittivity.style(@constants_screen_tagline_styles)

        ConstantsScreenText.new(self, @@font, 'Planck constant')
        @planck_constant = para('6.63 x 10', sup('-34'), ' Js')
        @planck_constant.style(@constants_screen_tagline_styles)

        ConstantsScreenText.new(self, @@font, 'Rest mass of electron')
        @electron_mass = para('9.11 x 10', sup('-31'), ' kg')
        @electron_mass.style(@constants_screen_tagline_styles)

        ConstantsScreenText.new(self, @@font, 'Rest mass of neutron')
        @neutron_mass = para('1.67 x 10', sup('-27'), ' kg')
        @neutron_mass.style(@constants_screen_tagline_styles)

        ConstantsScreenText.new(self, @@font, 'Avogadro constant')
        @avogadro_constant = para('6.02 x 10', sup('23'), ' mol', sup('-1'))
        @avogadro_constant.style(@constants_screen_tagline_styles)

        ConstantsScreenText.new(self, @@font, 'Stefan constant')
        @stefan_constant = para('5.67 x 10', sup('-8'), ' Wm', sup('-2'), 'K', sup('-4'))
        @stefan_constant.style(@constants_screen_tagline_styles)

        ConstantsScreenText.new(self, @@font, 'Gravitational constant')
        @gravitational_constant = para('6.67 x 10', sup('-11'), ' Nm', sup('2'), 'kg', sup('-2'))
        @gravitational_constant.style(@constants_screen_tagline_styles)
      end
      # Second content column
      stack(:height => 850, :width => 500) do
      	ConstantsScreenText.new(self, @@font, 'Permeability of free space')
        @free_space_permeability = para('4π x 10', sup('-7'), ' Hm', sup('-1'))
        @free_space_permeability.style(@constants_screen_tagline_styles)

        ConstantsScreenText.new(self, @@font, 'Elementary charge')
        @elementary_charge = para('1.60 x 10', sup('-19'), ' C')
        @elementary_charge.style(@constants_screen_tagline_styles)

        ConstantsScreenText.new(self, @@font, 'Unified atomic mass unit')
        @unified_atomic_mass_unit = para('1.66 x 10', sup('-27'), ' kg')
        @unified_atomic_mass_unit.style(@constants_screen_tagline_styles)

        ConstantsScreenText.new(self, @@font, 'Rest mass of proton')
        @proton_mass = para('1.67 x 10', sup('-27'), ' kg')
        @proton_mass.style(@constants_screen_tagline_styles)

        ConstantsScreenText.new(self, @@font, 'Molar gas constant')
        @molar_gas_constant = para('8.31', ' JK', sup('-1'), 'mol', sup('-1'))
        @molar_gas_constant.style(@constants_screen_tagline_styles)

        ConstantsScreenText.new(self, @@font, 'Boltzmann constant')
        @boltzmann_constant = para('1.38 x 10', sup('-23'), ' JK', sup('-1'))
        @boltzmann_constant.style(@constants_screen_tagline_styles)

        ConstantsScreenText.new(self, @@font, 'Wien constant')
        @wien_constant = para('2.9 x 10', sup('-3'), ' mK')
        @wien_constant.style(@constants_screen_tagline_styles)

        ConstantsScreenText.new(self, @@font, 'Acceleration of free fall')
        @free_fall_acceleration = para('9.81', ' ms', sup('-2'))
        @free_fall_acceleration.style(@constants_screen_tagline_styles)
      end
    end
  end

end
