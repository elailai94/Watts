#==============================================================================
# Watts
#
# @description: Module for providing functions to work with AngularVelocityV1Screen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Angular velocity v1 screen module (angular_velocity_v1_screen.rb)

require_relative '../../elements/screen_header.rb'
require_relative '../../elements/screen_label.rb'
require_relative '../../elements/screen_edit_line.rb'

# Object definition
class AngularVelocityV1Screen < Shoes

  url('/title_screen/circular_motion_screen/angular_velocity_v1_screen',
      :angular_velocity_v1_screen)

  # Draws the angular velocity v1 screen on the Shoes app window.
  def angular_velocity_v1_screen
    @heading = 'Angular velocity = linear velocity / radius'
    background('images/circular_motion_large.png')

    # Angular velocity v1 screen header
    ScreenHeader.new(self, '/title_screen/circular_motion_screen', @@font, @heading)

    # Angular velocity v1 screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:height => 640, :width => 80) do
      end
      # Content column
      stack(:height => 640, :width => 1000) do
        ScreenLabel.new(self, @@font, @heading, 'Linear velocity')
        flow do
          @linear_velocity = ScreenEditLine.new(self, @@font, @heading)
          @linear_velocity_unit = para(strong(' ms'), strong(sup('-1')))
          @linear_velocity_unit.style(@@screen_unit_text_styles)
        end

        ScreenLabel.new(self, @@font, @heading, 'Radius')
        flow do
          @radius = ScreenEditLine.new(self, @@font, @heading)
          @radius_unit = para(strong(' m'))
          @radius_unit.style(@@screen_unit_text_styles)
        end

        @calculate = button('Calculate')

        @result_display = flow

        @error_display = flow

        @calculate.click do
          @result_display.clear do
            @result = Joules.angular_velocity_v1(@linear_velocity.text.to_f,
                                                 @radius.text.to_f)
            @angular_velocity_v1 = para(@result.to_s)
            @angular_velocity_v1_unit = para(' rads', sup('-1'))
            @angular_velocity_v1.style(@@screen_result_text_styles)
            @angular_velocity_v1_unit.style(@@screen_result_text_styles)
          end
        end
      end
    end
  end

end
