#==============================================================================
# Watts
#
# @description: Module for providing functions to work with ForcesScreen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Forces screen module (forces_screen.rb)

require_relative '../elements/screen_header.rb'
require_relative '../elements/screen_box.rb'

require_relative 'forces-screens/force_v1_screen.rb'
require_relative 'forces-screens/force_v2_screen.rb'
require_relative 'forces-screens/force_v3_screen.rb'
require_relative 'forces-screens/maximum_friction_force_screen.rb'

# Object definition
class ForcesScreen < Shoes

  url('/title_screen/forces_screen',
      :forces_screen)

  def forces_screen
    @heading = 'Forces'
    @heading_edited = @heading.downcase.gsub(/[,&]/,'').squeeze(' ').gsub(' ','_')
    background("../images/#{@heading_edited}_large.png")

    # Forces screen header
    ScreenHeader.new(self, '/title_screen', @@font, @heading)

    # Forces screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:height => 640, :width => 80) do
      end
      # Content column
      stack(:height => 640, :width => 1000) do
        @formula_set =
          {'Force v1' => 'Force = mass x acceleration',
           'Force v2' => 'Force = spring constant x extension',
           'Force v3' => 'Force = ((final velocity - initial velocity) x mass) / time',
           'Maximum friction force' => 'Maximum friction force = coefficient of friction x normal force',
           'Buoyant force' => 'Buoyant force = density x acceleration of free fall x volume of liquid displaced',
           'Moment' => 'Moment = force x distance x angle'}
        @formula_set.each do |name, formula|
          ScreenBox.new(self, @@theme_colour, @@font, @heading, formula, name)
        end
      end
    end
  end

end
