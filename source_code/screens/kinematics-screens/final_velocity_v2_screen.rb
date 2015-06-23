#==============================================================================
# Watts
#
# @description: Module for providing functions to work with FinalVelocityV1Screen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Final velocity v2 screen module (final_velocity_v2_screen.rb)

require_relative '../../elements/screen_label.rb'
require_relative '../../elements/screen_edit_line.rb'

# Object definition
class FinalVelocityV2Screen < Shoes

  url('/title_screen/kinematics_screen/final_velocity_v2_screen',
  	  :final_velocity_v2_screen)

  # Draws the final velocity v2 screen on the Shoes app window.
  def final_velocity_v2_screen
    background('../images/kinematics_large.png')

    # Final velocity v2 screen header
    flow(:height => 80, :width => 1080, :scroll => false) do
      @back_button = image('../images/back_icon_white.png',
                           :click => '/title_screen/kinematics_screen')
      @heading = title('Final velocity = (initial velocity', sup('2'),
                       ' + (2 × acceleration × displacement))', sup('0.5'))
      @back_button.style(@@screen_header_image_styles)
      @heading.style(@@screen_header_text_styles)
    end

    # Final velocity v2 screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:height => 640, :width => 80) do
      end
      # Content column 
      stack(:height => 640, :width => 1000) do
        @heading_edited = @heading.text
        ScreenLabel.new(self, @@font, @heading_edited, 'Initial velocity')
        flow do
          @initial_velocity = ScreenEditLine.new(self, @@font, @heading_edited)
          @initial_velocity_unit = para(strong(' ms'), strong(sup('-1')))
          @initial_velocity_unit.style(@@screen_unit_text_styles)
        end

        ScreenLabel.new(self, @@font, @heading_edited, 'Acceleration')
        flow do
          @acceleration = ScreenEditLine.new(self, @@font, @heading_edited)
          @acceleration_unit = para(strong(' ms'), strong(sup('-2')))
          @acceleration_unit.style(@@screen_unit_text_styles)
        end

        ScreenLabel.new(self, @@font, @heading_edited, 'Displacement')
        flow do
          @displacement = ScreenEditLine.new(self, @@font, @heading_edited)
          @displacement_unit = para(strong(' m'))
          @displacement_unit.style(@@screen_unit_text_styles)
        end

        @calculate = button('Calculate')
        
        @result_display = flow

        @error_display = flow
        
        @calculate.click do
          @result_display.clear do
            @result = Joules.final_velocity_v2(@initial_velocity.text.to_f,
                                               @acceleration.text.to_f,
                                               @displacement.text.to_f)
            @final_velocity_v2 = para(@result.to_s)
            @final_velocity_v2_unit = para(' ms', sup('-1'))
            @final_velocity_v2.style(@@screen_result_text_styles)
            @final_velocity_v2_unit.style(@@screen_result_text_styles)
          end
        end
      end
    end
  end
	
end
