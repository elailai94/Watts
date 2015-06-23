#==============================================================================
# Watts
#
# @description: Module for providing functions to work with AccelerationScreen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Acceleration screen module (acceleration_screen.rb)

require_relative '../../elements/screen_header.rb'
require_relative '../../elements/screen_label.rb'
require_relative '../../elements/screen_edit_line.rb'

# Object definition
class AccelerationScreen < Shoes

  url('/title_screen/kinematics_screen/acceleration_screen',
      :acceleration_screen)

  # Draws the acceleration screen on the Shoes app window.
  def acceleration_screen
    @heading = 'Acceleration = (final velocity - initial velocity) / time'
    background('../images/kinematics_large.png')

    # Acceleration screen header
    ScreenHeader.new(self, '/title_screen/kinematics_screen', @@font, @heading)

    # Acceleration screen content
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
            @result = Joules.acceleration(@initial_velocity.text.to_f,
                                          @final_velocity.text.to_f,
                                          @time.text.to_f)
            @acceleration = para(@result.to_s)
            @acceleration_unit = para(' ms', sup('-2'))
            @acceleration.style(@@screen_result_text_styles)
            @acceleration_unit.style(@@screen_result_text_styles)
          end
        end
      end
    end
  end
	
end
