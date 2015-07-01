#==============================================================================
# Watts
#
# @description: Module for providing functions to work with PowerV2Screen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Power v2 screen module (power_v2_screen.rb)

require_relative '../../elements/screen_header.rb'
require_relative '../../elements/screen_label.rb'
require_relative '../../elements/screen_edit_line.rb'

# Object definition
class PowerV2Screen < Shoes

  url('/title_screen/energy_work_power_screen/power_v2_screen',
      :power_v2_screen)

  # Draws the power v2 screen on the Shoes app window.
  def power_v2_screen
    @heading = 'Power = force x velocity x cosine(angle)'
    background('images/energy_work_power_large.png')

    # Power v2 screen header
    ScreenHeader.new(self, '/title_screen/energy_work_power_screen', @@font, @heading)

    # Power v2 screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:height => 640, :width => 80) do
      end
      # Content column
      stack(:height => 640, :width => 1000) do
        ScreenLabel.new(self, @@font, @heading, 'Force')
        flow do
          @force = ScreenEditLine.new(self, @@font, @heading)
          @force_unit = para(strong(' N'))
          @force_unit.style(@@screen_unit_text_styles)
        end

        ScreenLabel.new(self, @@font, @heading, 'Velocity')
        flow do
          @velocity = ScreenEditLine.new(self, @@font, @heading)
          @velocity_unit = para(strong(' ms'), strong(sup('-1')))
          @velocity_unit.style(@@screen_unit_text_styles)
        end

        ScreenLabel.new(self, @@font, @heading, 'Angle (optional)')
        flow do
          @angle = ScreenEditLine.new(self, @@font, @heading)
          @angle_unit = para(strong(' deg'))
          @angle_unit.style(@@screen_unit_text_styles)
        end

        @calculate = button('Calculate')

        @result_display = flow

        @error_display = flow

        @calculate.click do
          @result_display.clear do
            if DataValidation.is_present(@angle)
              @angle_to_use = @angle.text
            else
              @angle_to_use = '0'
            end
            @result = Joules.power_v2(@force.text.to_f,
                                      @velocity.text.to_f,
                                      @angle_to_use.to_f)
            @power_v2 = para(@result.to_s)
            @power_v2_unit = para(' W')
            @power_v2.style(@@screen_result_text_styles)
            @power_v2_unit.style(@@screen_result_text_styles)
          end
        end
      end
    end
  end

end
