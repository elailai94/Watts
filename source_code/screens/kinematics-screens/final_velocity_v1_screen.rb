#==============================================================================
# Watts
#
# @description: Module for providing functions to work with FinalVelocityV1Screen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Final velocity v1 screen module (final_velocity_v1_screen.rb)

require_relative '../../elements/screen_header.rb'
require_relative '../../elements/screen_label.rb'
require_relative '../../elements/screen_edit_line.rb'

# Object definition
class FinalVelocityV1Screen < Shoes

  url('/title_screen/kinematics_screen/final_velocity_v1_screen',
  	  :final_velocity_v1_screen)

  # Draws the final velocity v1 screen on the Shoes app window.
  def final_velocity_v1_screen
    @heading = 'Final velocity = initial velocity + (acceleration × time)'
    background('../images/kinematics_large.png')

    # Final velocity v1 screen header
    ScreenHeader.new(self, '/title_screen/kinematics_screen', @@font, @heading)

    # Final velocity v1 screen content
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

        ScreenLabel.new(self, @@font, @heading, 'Acceleration')
        flow do
          @acceleration = ScreenEditLine.new(self, @@font, @heading)
          @acceleration_unit = para(strong(' ms'), strong(sup('-2')))
          @acceleration_unit.style(@@screen_unit_text_styles)
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
            @result = Joules.final_velocity_v1(@initial_velocity.text.to_f,
                                               @acceleration.text.to_f,
                                               @time.text.to_f)
            @final_velocity_v1 = para(@result.to_s)
            @final_velocity_v1_unit = para(' ms', sup('-1'))
            @final_velocity_v1.style(@@screen_result_text_styles)
            @final_velocity_v1_unit.style(@@screen_result_text_styles)
          end
        end
      end
    end
  end
	
end
