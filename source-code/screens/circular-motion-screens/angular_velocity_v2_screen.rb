#==============================================================================
# Watts
#
# @description: Module for providing functions to work with AngularVelocityV2Screen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Angular velocity v2 screen module (angular_velocity_v2_screen.rb)

require_relative '../../elements/screen_header.rb'
require_relative '../../elements/screen_label.rb'
require_relative '../../elements/screen_edit_line.rb'

# Object definition
class AngularVelocityV2Screen < Shoes

  url('/title_screen/circular_motion_screen/angular_velocity_v2_screen',
      :angular_velocity_v2_screen)

  # Draws the angular velocity v2 screen on the Shoes app window.
  def angular_velocity_v2_screen
    @heading = 'Angular velocity = 2π x frequency of rotation'
    background('images/circular_motion_large.png')

    # Angular velocity v2 screen header
    ScreenHeader.new(self, '/title_screen/circular_motion_screen', @@font, @heading)

    # Angular velocity v2 screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:height => 640, :width => 80) do
      end
      # Content column
      stack(:height => 640, :width => 1000) do
        ScreenLabel.new(self, @@font, @heading, 'Frequency of rotation')
        flow do
          @frequency_of_rotation = ScreenEditLine.new(self, @@font, @heading)
          @frequency_of_rotation_unit = para(strong(' Hz'))
          @frequency_of_rotation_unit.style(@@screen_unit_text_styles)
        end

        @calculate = button('Calculate')

        @result_display = flow

        @error_display = flow

        @calculate.click do
          @result_display.clear do
            @result = Joules.angular_velocity_v2(@frequency_of_rotation.text.to_f)
            @angular_velocity_v2 = para(@result.to_s)
            @angular_velocity_v2_unit = para(' rads', sup('-1'))
            @angular_velocity_v2.style(@@screen_result_text_styles)
            @angular_velocity_v2_unit.style(@@screen_result_text_styles)
          end
        end
      end
    end
  end

end
