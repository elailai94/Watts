#==============================================================================
# Watts
#
# @description: Module for providing functions to work with EnergyEfficiencyScreen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Energy efficiency screen module (energy_efficiency_screen.rb)

require_relative '../../elements/screen_header.rb'
require_relative '../../elements/screen_label.rb'
require_relative '../../elements/screen_edit_line.rb'

# Object definition
class EnergyEfficiencyScreen < Shoes

  url('/title_screen/energy_work_power_screen/energy_efficiency_screen',
      :energy_efficiency_screen)

  # Draws the energy efficiency screen on the Shoes app window.
  def energy_efficiency_screen
    @heading = 'Energy efficiency = (useful energy output / energy input) x 100'
    background('images/energy_work_power_large.png')

    # Energy efficiency screen header
    ScreenHeader.new(self, '/title_screen/energy_work_power_screen', @@font, @heading)

    # Energy efficiency screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:height => 640, :width => 80) do
      end
      # Content column
      stack(:height => 640, :width => 1000) do
        ScreenLabel.new(self, @@font, @heading, 'Useful energy output')
        flow do
          @useful_energy_output = ScreenEditLine.new(self, @@font, @heading)
          @useful_energy_output_unit = para(strong(' J'))
          @useful_energy_output_unit.style(@@screen_unit_text_styles)
        end

        ScreenLabel.new(self, @@font, @heading, 'Energy input')
        flow do
          @energy_input = ScreenEditLine.new(self, @@font, @heading)
          @energy_input_unit = para(strong(' J'))
          @energy_input_unit.style(@@screen_unit_text_styles)
        end

        @calculate = button('Calculate')

        @result_display = flow

        @error_display = flow

        @calculate.click do
          @result_display.clear do
            @result = Joules.energy_efficiency(@useful_energy_output.text.to_f,
                                               @energy_input.text.to_f)
            @energy_efficiency = para(@result.to_s)
            @energy_efficiency_unit = para(' %')
            @energy_efficiency.style(@@screen_result_text_styles)
            @energy_efficiency_unit.style(@@screen_result_text_styles)
          end
        end
      end
    end
  end

end
