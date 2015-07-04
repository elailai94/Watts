#==============================================================================
# Watts
#
# @description: Module for providing functions to work with MaximumParticleSpeedScreen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Maximum particle speed screen module (maximum_particle_speed_screen.rb)

require_relative '../../elements/screen_header.rb'
require_relative '../../elements/screen_label.rb'
require_relative '../../elements/screen_edit_line.rb'

# Object definition
class MaximumParticleSpeedScreen < Shoes

  url('/title_screen/oscillations_screen/maximum_particle_speed_screen',
      :maximum_particle_speed_screen)

  # Draws the maximum particle speed screen on the Shoes app window.
  def maximum_particle_speed_screen
    @heading = 'Maximum particle speed = angular velocity x amplitude'
    background('images/oscillations_large.png')

    # Maximum particle speed screen header
    ScreenHeader.new(self, '/title_screen/oscillations_screen', @@font, @heading)

    # Maximum particle speed screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:height => 640, :width => 80) do
      end
      # Content column
      stack(:height => 640, :width => 1000) do
        ScreenLabel.new(self, @@font, @heading, 'Angular velocity')
        flow do
          @angular_velocity = ScreenEditLine.new(self, @@font, @heading)
          @angular_velocity_unit = para(strong(' rads'), strong(sup('-1')))
          @angular_velocity_unit.style(@@screen_unit_text_styles)
        end

        ScreenLabel.new(self, @@font, @heading, 'Amplitude')
        flow do
          @amplitude = ScreenEditLine.new(self, @@font, @heading)
          @amplitude_unit = para(strong(' m'))
          @amplitude_unit.style(@@screen_unit_text_styles)
        end

        @calculate = button('Calculate')

        @result_display = flow

        @error_display = flow

        @calculate.click do
          @result_display.clear do
            @result = Joules.max_particle_speed(@angular_velocity.text.to_f,
                                                @amplitude.text.to_f)
            @maximum_particle_speed = para(@result.to_s)
            @maximum_particle_speed_unit = para(' ms', sup('-1'))
            @maximum_particle_speed.style(@@screen_result_text_styles)
            @maximum_particle_speed_unit.style(@@screen_result_text_styles)
          end
        end
      end
    end
  end

end
