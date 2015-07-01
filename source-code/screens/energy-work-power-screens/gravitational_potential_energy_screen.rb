#==============================================================================
# Watts
#
# @description: Module for providing functions to work with GravitationalPotentialEnergyScreen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Gravitational potential energy screen module (gravitational_potential_energy_screen.rb)

require_relative '../../elements/screen_header.rb'
require_relative '../../elements/screen_label.rb'
require_relative '../../elements/screen_edit_line.rb'

# Object definition
class GravitationalPotentialEnergyScreen < Shoes

  url('/title_screen/energy_work_power_screen/gravitational_potential_energy_screen',
      :gravitational_potential_energy_screen)

  # Draws the gravitational potential energy screen on the Shoes app window.
  def gravitational_potential_energy_screen
    @heading = 'Gravitational potential energy = mass x acceleration of free fall x height'
    background('images/energy_work_power_large.png')

    # Gravitational potential energy screen header
    ScreenHeader.new(self, '/title_screen/energy_work_power_screen', @@font, @heading)

    # Gravitational potential energy screen content
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

        ScreenLabel.new(self, @@font, @heading, 'Height')
        flow do
          @height = ScreenEditLine.new(self, @@font, @heading)
          @height_unit = para(strong(' m'))
          @height_unit.style(@@screen_unit_text_styles)
        end

        @calculate = button('Calculate')

        @result_display = flow

        @error_display = flow

        @calculate.click do
          @result_display.clear do
            @result = Joules.gravitational_potential_energy(@mass.text.to_f,
                                                            @height.text.to_f)
            @gravitational_potential_energy = para(@result.to_s)
            @gravitational_potential_energy_unit = para(' J')
            @gravitational_potential_energy.style(@@screen_result_text_styles)
            @gravitational_potential_energy_unit.style(@@screen_result_text_styles)
          end
        end
      end
    end
  end

end
