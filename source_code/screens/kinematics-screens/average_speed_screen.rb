#==============================================================================
# Watts
#
# @description: Module for providing functions to work with KinematicsScreen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Average speed screen module (kinematics_screen.rb)

require_relative '../../elements/screen_header.rb'
require_relative '../../elements/screen_label.rb'
require_relative '../../elements/screen_edit_line.rb'

# Object definition
class AverageSpeedScreen < Shoes

  url('/title_screen/kinematics_screen/average_speed_screen', :average_speed_screen)

  # Draws the average speed screen on the Shoes app window.
  def average_speed_screen
    @heading = 'Average speed = distance / time'
    background('../images/kinematics_large.png')

    # Average speed screen header
    ScreenHeader.new(self, '/title_screen/kinematics_screen', @@font, @heading)

    # Average speed screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:height => 640, :width => 80) do
      end
      # Content column 
      stack(:height => 640, :width => 1000) do
        ScreenLabel.new(self, @@font, @heading, 'Distance')
        flow do
          @distance = ScreenEditLine.new(self, @@font, @heading)
          @distance_unit = para(strong(' m'))
          @distance_unit.style(@@screen_unit_text_styles)
        end
        
        ScreenLabel.new(self, @@font, @heading, 'Time')
        flow do
          @time = ScreenEditLine.new(self, @@font, @heading)
          @time_unit = para(strong(' s'))
          @time_unit.style(@@screen_unit_text_styles)
        end

        @calculate = button('Calculate')
        
        @result_display = flow
        
        @calculate.click do
          @result_display.clear do
            @result = Joules.avg_speed(@distance.text.to_f, @time.text.to_f)
            @average_speed = para(@result.to_s)
            @average_speed_unit = para(' ms', sup('-1'))
            @average_speed.style(@@screen_result_text_styles)
            @average_speed_unit.style(@@screen_result_text_styles)
          end
        end
      end
    end
  end
	
end
