#==============================================================================
# Watts
#
# @description: Module for providing functions to work with StressStrainScreen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Stress strain screen module (stress_strain_screen.rb)

require_relative '../elements/screen_header.rb'
require_relative '../elements/screen_box.rb'

#require_relative 'stress-strain-screens/weight_screen.rb'

# Object definition
class StressStrainScreen < Shoes

  url('/title_screen/stress_strain_screen',
      :stress_strain_screen)

  # Draws the stress strain screen on the Shoes app window.
  def stress_strain_screen
    @heading = 'Stress & strain'
    @heading_edited = @heading.downcase.gsub(/[,&]/,'').squeeze(' ').gsub(' ','_')
    background("../images/#{@heading_edited}_large.png")

    # Stress strain screen header
    ScreenHeader.new(self, '/title_screen', @@font, @heading)

    # Stress strain screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:height => 640, :width => 80) do
      end
      # Content column
      stack(:height => 640, :width => 1000) do
        @formula_set =
          {'Tensile stress' => 'Tensile stress = force / area',
           'Tensile strain' => 'Tensile strain = extension / length',
           'Young modulus' => 'Young modulus = tensile stress / tensile strain'}
        @formula_set.each do |name, formula|
          ScreenBox.new(self, @@theme_colour, @@font, @heading, formula, name)
        end
      end
    end
  end

end
