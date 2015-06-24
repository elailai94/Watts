#==============================================================================
# Watts
#
# @description: Module for providing functions to work with CentripetalAccelerationV1Screen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Centripetal acceleration v1 screen module (centripetal_acceleration_v1_screen.rb)

require_relative '../../elements/screen_label.rb'
require_relative '../../elements/screen_edit_line.rb'

# Object definition
class CentripetalAccelerationV1Screen < Shoes

  url('/title_screen/circular_motion_screen/centripetal_acceleration_v1_screen',
      :centripetal_acceleration_v1_screen)

  # Draws the centripetal acceleration v1 screen on the Shoes app window.
  def centripetal_acceleration_v1_screen
    background('../images/circular_motion_large.png')

    # Centripetal acceleration v1 screen header
    flow(:height => 80, :width => 1080, :scroll => false) do
      @back_button = image('../images/back_icon_white.png',
                           :click => '/title_screen/circular_motion_screen')
      @heading = title('Centripetal acceleration = linear velocity',
                       sup('2'), ' / radius')
      @back_button.style(@@screen_header_image_styles)
      @heading.style(@@screen_header_text_styles)
    end

    # Centripetal acceleration v1 screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:height => 640, :width => 80) do
      end
      # Content column 
      stack(:height => 640, :width => 1000) do
        @heading_edited = @heading.text
        ScreenLabel.new(self, @@font, @heading_edited, 'Linear velocity')
        flow do
          @linear_velocity = ScreenEditLine.new(self, @@font, @heading_edited)
          @linear_velocity_unit = para(strong(' ms'), strong(sup('-1')))
          @linear_velocity_unit.style(@@screen_unit_text_styles)
        end

        ScreenLabel.new(self, @@font, @heading_edited, 'Radius')
        flow do
          @radius = ScreenEditLine.new(self, @@font, @heading_edited)
          @radius_unit = para(strong(' m'))
          @radius_unit.style(@@screen_unit_text_styles)
        end

        @calculate = button('Calculate')
        
        @result_display = flow

        @error_display = flow
        
        @calculate.click do
          @result_display.clear do
            @result = Joules.centripetal_acceleration_v1(@linear_velocity.text.to_f,
                                                         @radius.text.to_f)
            @centripetal_acceleration_v1 = para(@result.to_s)
            @centripetal_acceleration_v1_unit = para(' ms', sup('-2'))
            @centripetal_acceleration_v1.style(@@screen_result_text_styles)
            @centripetal_acceleration_v1_unit.style(@@screen_result_text_styles)
          end
        end
      end
    end
  end
	
end
