#==============================================================================
# Watts
#
# @description: Module for providing functions to work with EnergyV1Screen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Energy v1 screen module (energy_v1_screen.rb)

require_relative '../../elements/screen_header.rb'
require_relative '../../elements/screen_label.rb'
require_relative '../../elements/screen_edit_line.rb'

# Object definition
class EnergyV1Screen < Shoes

  url('/title_screen/thermodynamics_screen/energy_v1_screen',
      :energy_v1_screen)

  # Draws the energy v1 screen on the Shoes app window.
  def energy_v1_screen
    @heading = 'Energy = mass x specific heat capacity x temperature change'
    background('images/thermodynamics_large.png')

    # Energy v1 screen header
    ScreenHeader.new(self, '/title_screen/thermodynamics_screen', @@font, @heading)

    # Energy v1 screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:height => 640, :width => 80) do
      end
      # Content column
      stack(:height => 640, :width => 1000) do
        ScreenLabel.new(self, @@font, @heading, 'Mass')
        flow do
          @mass = ScreenEditLine.new(self, @@font, @heading)
          @mass_unit = para(strong(' kg'))
          @mass_unit.style(@@screen_unit_text_styles)
        end

        ScreenLabel.new(self, @@font, @heading, 'Specific heat capacity')
        flow do
          @specific_heat_capacity = ScreenEditLine.new(self, @@font, @heading)
          @specific_heat_capacity_unit = para(strong(' Jkg'), strong(sup('-1')), strong('°C'), strong(sup('-1')))
          @specific_heat_capacity_unit.style(@@screen_unit_text_styles)
        end

        ScreenLabel.new(self, @@font, @heading, 'Temperature change')
        flow do
          @temperature_change = ScreenEditLine.new(self, @@font, @heading)
          @temperature_change_unit = para(strong(' °C'))
          @temperature_change_unit.style(@@screen_unit_text_styles)
        end

        @calculate = button('Calculate')

        @result_display = flow

        @error_display = flow

        @calculate.click do
          @result_display.clear do
            @result = Joules.energy_v1(@mass.text.to_f,
                                       @specific_heat_capacity.text.to_f,
                                       @temperature_change.text.to_f)
            @energy_v1 = para(@result.to_s)
            @energy_v1_unit = para(' J')
            @energy_v1.style(@@screen_result_text_styles)
            @energy_v1_unit.style(@@screen_result_text_styles)
          end
        end
      end
    end
  end

end
