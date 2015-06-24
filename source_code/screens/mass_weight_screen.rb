#==============================================================================
# Watts
#
# @description: Module for providing functions to work with MassWeightScreen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Mass weight screen module (mass_weight_screen.rb)

require_relative '../elements/screen_header.rb'
require_relative '../elements/screen_box.rb'

# Object definition
class MassWeightScreen < Shoes

  url('/title_screen/mass_weight_screen',
      :mass_weight_screen)

  # Draws the mass weight screen on the Shoes app window.
  def mass_weight_screen
    @heading = 'Mass & weight'
    @heading_edited = @heading.downcase.gsub(/[,&]/,'').squeeze(' ').gsub(' ','_')
    background("../images/#{@heading_edited}_large.png")
    
    # Mass weight screen header
    ScreenHeader.new(self, '/title_screen', @@font, @heading)

    # Mass weight screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:height => 640, :width => 80) do
      end
      # Content column 
      stack(:height => 640, :width => 1000) do
        @formula_set =
          {'Weight' => 'Weight = mass × acceleration of free fall',
           'Mass' => 'Mass = weight / acceleration of free fall'}
        @formula_set.each do |name, formula|
          ScreenBox.new(self, @@theme_colour, @@font, @heading, formula, name)
        end
      end
    end
  end

end
