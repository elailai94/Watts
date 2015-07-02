#==============================================================================
# Watts
#
# @description: Module for providing functions to work with OscillationsScreen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Oscillations screen module (oscillations_screen.rb)

require_relative '../elements/screen_header.rb'
require_relative '../elements/screen_box.rb'

#require_relative 'oscillations-screens/particle_acceleration_screen.rb'

# Object definition
class OscillationsScreen < Shoes

  url('/title_screen/oscillations_screen',
      :oscillations_screen)

  # Draws the oscillations screen on the Shoes app window.
  def oscillations_screen
    @heading = 'Oscillations'
    @heading_edited = @heading.downcase.gsub(/[,&]/,'').squeeze(' ').gsub(' ','_')
    background("images/#{@heading_edited}_large.png")

    # Oscillations screen header
    ScreenHeader.new(self, '/title_screen', @@font, @heading)

    # Oscillations screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:height => 640, :width => 80) do
      end
      # Content column
      stack(:height => 640, :width => 1000) do
        @formula_set =
          {'Particle displacement' => 'Particle displacement = amplitude x cosine(angular velocity x time)',
           'Maximum particle speed' => 'Maximum particle speed = angular velocity x amplitude'}
        @formula_set.each do |name, formula|
          ScreenBox.new(self, @@theme_colour, @@font, @heading, formula, name)
        end

        stack(:height => 100, :width => 940, :margin => 2) do
          background(@@theme_colour)
          @particle_acceleration = para('Particle acceleration = - (angular velocity', sup('2'),
                                        ' x displacement)')
          @particle_acceleration.style(@@screen_box_text_styles)
          click do
            visit("/title_screen/#{@heading_edited}_screen/particle_acceleration_screen")
          end
        end
      end
    end
  end

end
