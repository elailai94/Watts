#==============================================================================
# Watts
#
# @description: Module for providing functions to work with DisplacementV3Screen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Displacement v3 screen module (displacement_v3_screen.rb)

require_relative '../../elements/screen_label.rb'
require_relative '../../elements/screen_edit_line.rb'

# Object definition
class DisplacementV3Screen < Shoes

  url('/title_screen/kinematics_screen/displacement_v3_screen',
      :displacement_v3_screen)

  # Draws the displacement v3 screen on the Shoes app window.
  def displacement_v3_screen
    background('../images/kinematics_large.png')

    # Displacement v3 screen header
    flow(:height => 80, :width => 1080, :scroll => false) do
      @back_button = image('../images/back_icon_white.png',
                           :click => '/title_screen/kinematics_screen')
      @heading = title('Displacement = (final velocity × time) - (0.5 × acceleration × time',
                       sup('2'), ')')
      @back_button.style(@@screen_header_image_styles)
      @heading.style(@@screen_header_text_styles)
    end

    # Displacement v3 screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:height => 640, :width => 80) do
      end
      # Content column 
      stack(:height => 640, :width => 1000) do
        @heading_edited = @heading.text
        ScreenLabel.new(self, @@font, @heading_edited, 'Final velocity')
        flow do
          @final_velocity = ScreenEditLine.new(self, @@font, @heading_edited)
          @final_velocity_unit = para(strong(' ms'), strong(sup('-1')))
          @final_velocity_unit.style(@@screen_unit_text_styles)
        end

        ScreenLabel.new(self, @@font, @heading_edited, 'Acceleration')
        flow do
          @acceleration = ScreenEditLine.new(self, @@font, @heading_edited)
          @acceleration_unit = para(strong(' ms'), strong(sup('-2')))
          @acceleration_unit.style(@@screen_unit_text_styles)
        end

        ScreenLabel.new(self, @@font, @heading_edited, 'Time')
        flow do
          @time = ScreenEditLine.new(self, @@font, @heading_edited)
          @time_unit = para(strong(' s'))
          @time_unit.style(@@screen_unit_text_styles)
        end

        @calculate = button('Calculate')
        
        @result_display = flow

        @error_display = flow
        
        @calculate.click do
          @result_display.clear do
            @result = Joules.displacement_v3(@final_velocity.text.to_f,
                                             @acceleration.text.to_f,
                                             @time.text.to_f)
            @displacement_v3 = para(@result.to_s)
            @displacement_v3_unit = para(' m')
            @displacement_v3.style(@@screen_result_text_styles)
            @displacement_v3_unit.style(@@screen_result_text_styles)
          end
        end
      end
    end
  end
	
end
