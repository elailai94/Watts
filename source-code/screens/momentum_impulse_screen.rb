#==============================================================================
# Watts
#
# @description: Module for providing functions to work with MomentumImpulseScreen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Momentum impulse screen module (momentum_impulse_screen.rb)

require_relative '../elements/screen_header.rb'
require_relative '../elements/screen_box.rb'

require_relative 'momentum-impulse-screens/momentum_screen.rb'
require_relative 'momentum-impulse-screens/impulse_v1_screen.rb'
require_relative 'momentum-impulse-screens/impulse_v2_screen.rb'

# Object definition
class MomentumImpulseScreen < Shoes

  url('/title_screen/momentum_impulse_screen',
      :momentum_impulse_screen)

  def momentum_impulse_screen
    @heading = 'Momentum & impulse'
    @heading_edited = @heading.downcase.gsub(/[,&]/,'').squeeze(' ').gsub(' ','_')
    background("images/#{@heading_edited}_large.png")

    # Momentum impulse screen header
    ScreenHeader.new(self, '/title_screen', @@font, @heading)

    # Momentum impulse screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:height => 640, :width => 80) do
      end
      # Content column
      stack(:height => 640, :width => 1000) do
        @formula_set =
          {'Momentum' => 'Momentum = mass x velocity',
           'Impulse v1' => 'Impulse = force x time',
           'Impulse v2' => 'Impulse = (final velocity - initial velocity) x mass'}
        @formula_set.each do |name, formula|
          ScreenBox.new(self, @@theme_colour, @@font, @heading, formula, name)
        end
      end
    end
  end

end
