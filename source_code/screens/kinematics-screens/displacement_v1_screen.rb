#==============================================================================
# Watts
#
# @description: Module for providing functions to work with DisplacementV1Screen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Displacement v1 screen module (displacement_v1_screen.rb)

require_relative '../../elements/screen_header.rb'
require_relative '../../elements/screen_label.rb'
require_relative '../../elements/screen_edit_line.rb'

# Object definition
class DisplacementV1Screen < Shoes

  url('/title_screen/kinematics_screen/displacement_v1_screen',
      :displacement_v1_screen)

  # Draws the displacement v1 screen on the Shoes app window.
  def displacement_v1_screen
    @heading = 'Displacement = 0.5 × (initial velocity + final velocity) × time'
    background('../images/kinematics_large.png')

    # Displacement v1 screen header
    ScreenHeader.new(self, '/title_screen/kinematics_screen', @@font, @heading)

    # Displacement v1 screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:height => 640, :width => 80) do
      end
      # Content column 
      stack(:height => 640, :width => 1000) do
      ScreenLabel.new(self, @@font, @heading, 'Initial velocity')
        flow do
          @initial_velocity = ScreenEditLine.new(self, @@font, @heading)
          @initial_velocity_unit = para(strong(' ms'), strong(sup('-1')))
          @initial_velocity_unit.style(@@screen_unit_text_styles)
        end

        ScreenLabel.new(self, @@font, @heading, 'Final velocity')
        flow do
          @final_velocity = ScreenEditLine.new(self, @@font, @heading)
          @final_velocity_unit = para(strong(' ms'), strong(sup('-1')))
          @final_velocity_unit.style(@@screen_unit_text_styles)
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
            @result = Joules.displacement_v1(@initial_velocity.text.to_f,
                                             @final_velocity.text.to_f,
                                             @time.text.to_f)
            @displacement_v1 = para(@result.to_s)
            @displacement_v1_unit = para(' m')
            @displacement_v1.style(@@screen_result_text_styles)
            @displacement_v1_unit.style(@@screen_result_text_styles)
          end
        end
      end
    end
  end
  
end

