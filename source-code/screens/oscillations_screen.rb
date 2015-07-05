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

require_relative 'oscillations-screens/particle_displacement_screen.rb'
require_relative 'oscillations-screens/maximum_particle_speed_screen.rb'
require_relative 'oscillations-screens/particle_acceleration_screen.rb'
require_relative 'oscillations-screens/particle_velocity_screen.rb'
require_relative 'oscillations-screens/maximum_particle_acceleration_screen.rb'
require_relative 'oscillations-screens/time_period_v2_screen.rb'
require_relative 'oscillations-screens/time_period_v3_screen.rb'

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
      stack(:height => 750, :width => 80) do
      end
      # Content column
      stack(:height => 750, :width => 1000) do
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

        stack(:height => 100, :width => 940, :margin => 2) do
          background(@@theme_colour)
          @particle_velocity = para('Particle velocity = angular velocity x (amplitude', sup('2'),
                                        ' - particle displacement', sup('2'), ')', sup('0.5'))
          @particle_velocity.style(@@screen_box_text_styles)
          click do
            visit("/title_screen/#{@heading_edited}_screen/particle_velocity_screen")
          end
        end

        stack(:height => 100, :width => 940, :margin => 2) do
          background(@@theme_colour)
          @maximum_particle_acceleration = para('Maximum particle acceleration = angular velocity',
                                                sup('2'), ' x amplitude')
          @maximum_particle_acceleration.style(@@screen_box_text_styles)
          click do
            visit("/title_screen/#{@heading_edited}_screen/maximum_particle_acceleration_screen")
          end
        end

        stack(:height => 100, :width => 940, :margin => 2) do
          background(@@theme_colour)
          @time_period_v2 = para('Time period = 2π x (mass / spring constant)', sup('0.5'))
          @time_period_v2.style(@@screen_box_text_styles)
          click do
            visit("/title_screen/#{@heading_edited}_screen/time_period_v2_screen")
          end
        end

        stack(:height => 100, :width => 940, :margin => 2) do
          background(@@theme_colour)
          @time_period_v3 = para('Time period = 2π x (pendulum length / acceleration of free fall)',
                                 sup('0.5'))
          @time_period_v3.style(@@screen_box_text_styles)
          click do
            visit("/title_screen/#{@heading_edited}_screen/time_period_v3_screen")
          end
        end
      end
    end
  end

end
