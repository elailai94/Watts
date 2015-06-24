#==============================================================================
# Watts
#
# @description: Module for providing functions to work with DensityScreen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Density screen module (density_screen.rb)

require_relative '../elements/screen_header.rb'
require_relative '../elements/screen_box.rb'

# Object definition
class DensityScreen < Shoes

  url('/title_screen/density_screen',
      :density_screen)

  # Draws the density screen on the Shoes app window.
  def density_screen
    @heading = 'Density'
    @heading_edited = @heading.downcase.gsub(/[,&]/,'').squeeze(' ').gsub(' ','_')
    background("../images/#{@heading_edited}_large.png")
    
    # Density screen header
    ScreenHeader.new(self, '/title_screen', @@font, @heading)

    # Density screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:height => 640, :width => 80) do
      end
      # Content column 
      stack(:height => 640, :width => 1000) do
        @formula_set =
          {'Density Sub' => 'Density = mass / volume'}
        @formula_set.each do |name, formula|
          ScreenBox.new(self, @@theme_colour, @@font, @heading, formula, name)
        end
      end
    end
  end

end
