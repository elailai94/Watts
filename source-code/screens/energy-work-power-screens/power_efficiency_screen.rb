#==============================================================================
# Watts
#
# @description: Module for providing functions to work with PowerEfficiencyScreen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Power efficiency screen module (power_efficiency_screen.rb)

require_relative '../../elements/screen_header.rb'
require_relative '../../elements/screen_label.rb'
require_relative '../../elements/screen_edit_line.rb'

# Object definition
class PowerEfficiencyScreen < Shoes

  url('/title_screen/energy_work_power_screen/power_efficiency_screen',
      :power_efficiency_screen)

  # Draws the power efficiency screen on the Shoes app window.
  def power_efficiency_screen
    @heading = 'Power efficiency = (useful power output / power input) x 100'
    background('images/energy_work_power_large.png')

    # Power efficiency screen header
    ScreenHeader.new(self, '/title_screen/energy_work_power_screen', @@font, @heading)

    # Power efficiency screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:height => 640, :width => 80) do
      end
      # Content column
      stack(:height => 640, :width => 1000) do
        ScreenLabel.new(self, @@font, @heading, 'Useful power output')
        flow do
          @useful_power_output = ScreenEditLine.new(self, @@font, @heading)
          @useful_power_output_unit = para(strong(' W'))
          @useful_power_output_unit.style(@@screen_unit_text_styles)
        end

        ScreenLabel.new(self, @@font, @heading, 'Power input')
        flow do
          @power_input = ScreenEditLine.new(self, @@font, @heading)
          @power_input_unit = para(strong(' W'))
          @power_input_unit.style(@@screen_unit_text_styles)
        end

        @calculate = button('Calculate')

        @result_display = flow

        @error_display = flow

        @calculate.click do
          @result_display.clear do
            @result = Joules.power_efficiency(@useful_power_output.text.to_f,
                                              @power_input.text.to_f)
            @power_efficiency = para(@result.to_s)
            @power_efficiency_unit = para(' %')
            @power_efficiency.style(@@screen_result_text_styles)
            @power_efficiency_unit.style(@@screen_result_text_styles)
          end
        end
      end
    end
  end

end
