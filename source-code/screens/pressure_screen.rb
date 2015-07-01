#==============================================================================
# Watts
#
# @description: Module for providing functions to work with PressureScreen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Pressure screen module (pressure_screen.rb)

require_relative '../elements/screen_header.rb'
require_relative '../elements/screen_box.rb'

# require_relative 'pressure-screens/pressure_sub_screen.rb'

# Object definition
class PressureScreen < Shoes

  url('/title_screen/pressure_screen',
      :pressure_screen)

  # Draws the pressure screen on the Shoes app window.
  def pressure_screen
    @heading = 'Pressure'
    @heading_edited = @heading.downcase.gsub(/[,&]/,'').squeeze(' ').gsub(' ','_')
    background("images/#{@heading_edited}_large.png")

    # Pressure screen header
    ScreenHeader.new(self, '/title_screen', @@font, @heading)

    # Pressure screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:height => 640, :width => 80) do
      end
      # Content column
      stack(:height => 640, :width => 1000) do
        @formula_set =
          {'Pressure sub' => 'Pressure = force / area',
           'Hydrostatic pressure' => 'Hydrostatic pressure = density x acceleration of free fall x height'}
        @formula_set.each do |name, formula|
          ScreenBox.new(self, @@theme_colour, @@font, @heading, formula, name)
        end
      end
    end
  end

end
