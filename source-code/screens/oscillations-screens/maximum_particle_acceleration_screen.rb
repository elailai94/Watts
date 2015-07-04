#==============================================================================
# Watts
#
# @description: Module for providing functions to work with MaximumParticleAccelerationScreen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Maximum particle acceleration screen module (maximum_particle_acceleration_screen.rb)

require_relative '../../elements/screen_label.rb'
require_relative '../../elements/screen_edit_line.rb'

# Object definition
class MaximumParticleAccelerationScreen < Shoes

  url('/title_screen/oscillations_screen/maximum_particle_acceleration_screen',
      :maximum_particle_acceleration_screen)

  # Draws the maximum particle acceleration screen on the Shoes app window.
  def maximum_particle_acceleration_screen
    background('images/oscillations_large.png')

    # Maximum particle acceleration screen header
    flow(:height => 80, :width => 1080, :scroll => false) do
      @back_button = image('images/back_icon_white.png',
                           :click => '/title_screen/oscillations_screen')
      @heading = title('Maximum particle acceleration = angular velocity',
                       sup('2'), ' x amplitude')
      @back_button.style(@@screen_header_image_styles)
      @heading.style(@@screen_header_text_styles)
    end

    # Maximum particle acceleration screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:height => 640, :width => 80) do
      end
      # Content column
      stack(:height => 640, :width => 1000) do
        @heading_edited = @heading.text
        ScreenLabel.new(self, @@font, @heading_edited, 'Angular velocity')
        flow do
          @angular_velocity = ScreenEditLine.new(self, @@font, @heading_edited)
          @angular_velocity_unit = para(strong(' rads'), strong(sup('-1')))
          @angular_velocity_unit.style(@@screen_unit_text_styles)
        end

        ScreenLabel.new(self, @@font, @heading_edited, 'Amplitude')
        flow do
          @amplitude = ScreenEditLine.new(self, @@font, @heading_edited)
          @amplitude_unit = para(strong(' m'))
          @amplitude_unit.style(@@screen_unit_text_styles)
        end

        @calculate = button('Calculate')

        @result_display = flow

        @error_display = flow

        @calculate.click do
          @result_display.clear do
            @result = Joules.max_particle_acceleration(@angular_velocity.text.to_f,
                                                       @amplitude.text.to_f)
            @maximum_particle_acceleration = para(@result.to_s)
            @maximum_particle_acceleration_unit = para(' ms', sup('-2'))
            @maximum_particle_acceleration.style(@@screen_result_text_styles)
            @maximum_particle_acceleration_unit.style(@@screen_result_text_styles)
          end
        end
      end
    end
  end

end
