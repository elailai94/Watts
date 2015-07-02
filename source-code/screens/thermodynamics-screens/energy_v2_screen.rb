#==============================================================================
# Watts
#
# @description: Module for providing functions to work with EnergyV2Screen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Energy v2 screen module (energy_v2_screen.rb)

require_relative '../../elements/screen_header.rb'
require_relative '../../elements/screen_label.rb'
require_relative '../../elements/screen_edit_line.rb'

# Object definition
class EnergyV2Screen < Shoes

  url('/title_screen/thermodynamics_screen/energy_v2_screen',
      :energy_v2_screen)

  # Draws the energy v2 screen on the Shoes app window.
  def energy_v2_screen
    @heading = 'Energy = mass x specific latent heat'
    background('images/thermodynamics_large.png')

    # Energy v2 screen header
    ScreenHeader.new(self, '/title_screen/thermodynamics_screen', @@font, @heading)

    # Energy v2 screen content
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

        ScreenLabel.new(self, @@font, @heading, 'Specific latent heat')
        flow do
          @specific_latent_heat = ScreenEditLine.new(self, @@font, @heading)
          @specific_latent_heat_unit = para(strong(' Jkg'), strong(sup('-1')))
          @specific_latent_heat_unit.style(@@screen_unit_text_styles)
        end

        @calculate = button('Calculate')

        @result_display = flow

        @error_display = flow

        @calculate.click do
          @result_display.clear do
            @result = Joules.energy_v2(@mass.text.to_f,
                                       @specific_latent_heat.text.to_f)
            @energy_v2 = para(@result.to_s)
            @energy_v2_unit = para(' J')
            @energy_v2.style(@@screen_result_text_styles)
            @energy_v2_unit.style(@@screen_result_text_styles)
          end
        end
      end
    end
  end

end
