#==============================================================================
# Watts
#
# @description: Module for providing functions to work with ThermodynamicsScreen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Thermodynamics screen module (thermodynamics_screen.rb)

require_relative '../elements/screen_header.rb'
require_relative '../elements/screen_box.rb'

require_relative 'thermodynamics-screens/energy_v1_screen.rb'
require_relative 'thermodynamics-screens/energy_v2_screen.rb'

# Object definition
class ThermodynamicsScreen < Shoes

  url('/title_screen/thermodynamics_screen',
      :thermodynamics_screen)

  # Draws the thermodynamics screen on the Shoes app window.
  def thermodynamics_screen
    @heading = 'Thermodynamics'
    @heading_edited = @heading.downcase.gsub(/[,&]/,'').squeeze(' ').gsub(' ','_')
    background("images/#{@heading_edited}_large.png")

    # Thermodynamics screen header
    ScreenHeader.new(self, '/title_screen', @@font, @heading)

    # Thermodynamics screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:height => 640, :width => 80) do
      end
      # Content column
      stack(:height => 640, :width => 1000) do
        @formula_set =
          {'Energy v1' => 'Energy = mass x specific heat capacity x temperature change',
           'Energy v2' => 'Energy = mass x specific latent heat'}
        @formula_set.each do |name, formula|
          ScreenBox.new(self, @@theme_colour, @@font, @heading, formula, name)
        end
      end
    end
  end

end
