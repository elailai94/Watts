#==============================================================================
# Watts
#
# @description: Module for providing functions to work with AngularAccelerationScreen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Angular acceleration screen module (angular_acceleration_screen.rb)

require_relative '../../elements/screen_header.rb'
require_relative '../../elements/screen_label.rb'
require_relative '../../elements/screen_edit_line.rb'

# Object definition
class AngularAccelerationScreen < Shoes

  url('/title_screen/circular_motion_screen/angular_acceleration_screen',
      :angular_acceleration_screen)

  # Draws the angular acceleration screen on the Shoes app window.
  def angular_acceleration_screen
    @heading = 'Angular acceleration = (final angular velocity - initial angular velocity) / time'
    background('images/circular_motion_large.png')

    # Angular acceleration screen header
    ScreenHeader.new(self, '/title_screen/circular_motion_screen', @@font, @heading)

    # Angular acceleration screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:height => 640, :width => 80) do
      end
      # Content column
      stack(:height => 640, :width => 1000) do
        ScreenLabel.new(self, @@font, @heading, 'Initial angular velocity')
        flow do
          @initial_angular_velocity = ScreenEditLine.new(self, @@font, @heading)
          @initial_angular_velocity_unit = para(strong(' rads'), strong(sup('-1')))
          @initial_angular_velocity_unit.style(@@screen_unit_text_styles)
        end

        ScreenLabel.new(self, @@font, @heading, 'Final angular velocity')
        flow do
          @final_angular_velocity = ScreenEditLine.new(self, @@font, @heading)
          @final_angular_velocity_unit = para(strong(' rads'), strong(sup('-1')))
          @final_angular_velocity_unit.style(@@screen_unit_text_styles)
        end

        ScreenLabel.new(self, @@font, @heading, 'Time')
        flow do
          @time = ScreenEditLine.new(self, @@font, @heading)
          @time_unit = para(strong(' s'))
          @time_unit.style(@@screen_unit_text_styles)
        end

        @calculate = button('Calculate')

        @result_display = flow

        @error_display = flow

        @calculate.click do
          @result_display.clear do
            @result = Joules.angular_acceleration(@initial_angular_velocity.text.to_f,
                                                  @final_angular_velocity.text.to_f,
                                                  @time.text.to_f)
            @angular_acceleration = para(@result.to_s)
            @angular_acceleration_unit = para(' rads', sup('-2'))
            @angular_acceleration.style(@@screen_result_text_styles)
            @angular_acceleration_unit.style(@@screen_result_text_styles)
          end
        end
      end
    end
  end

end
