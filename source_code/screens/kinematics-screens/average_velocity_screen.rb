#==============================================================================
# Watts
#
# @description: Module for providing functions to work with AverageVelocityScreen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Average velocity screen module (average_velocity_screen.rb)

require_relative '../../elements/screen_header.rb'
require_relative '../../elements/screen_label.rb'
require_relative '../../elements/screen_edit_line.rb'

# Object definition
class AverageVelocityScreen < Shoes

  url('/title_screen/kinematics_screen/average_velocity_screen',
  	  :average_velocity_screen)

  # Draws the average velocity screen on the Shoes app window.
  def average_velocity_screen
    @heading = 'Average velocity = displacement / time'
    background('../images/kinematics_large.png')

    # Average velocity screen header
    ScreenHeader.new(self, '/title_screen/kinematics_screen', @@font, @heading)

    # Average velocity screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:height => 640, :width => 80) do
      end
      # Content column 
      stack(:height => 640, :width => 1000) do
        ScreenLabel.new(self, @@font, @heading, 'Displacement')
        flow do
          @displacement = ScreenEditLine.new(self, @@font, @heading)
          @displacement_unit = para(strong(' m'))
          @displacement_unit.style(@@screen_unit_text_styles)
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
            @result = Joules.avg_velocity(@displacement.text.to_f, @time.text.to_f)
            @avg_velocity = para(@result.to_s)
            @avg_velocity_unit = para(' ms', sup('-1'))
            @avg_velocity.style(@@screen_result_text_styles)
            @avg_velocity_unit.style(@@screen_result_text_styles)
          end
        end
      end
    end
  end
	
end
