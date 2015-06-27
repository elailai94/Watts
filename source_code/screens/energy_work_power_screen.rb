#==============================================================================
# Watts
#
# @description: Module for providing functions to work with EnergyWorkPowerScreen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Energy work power screen module (energy_work_power_screen.rb)

require_relative '../elements/screen_header.rb'
require_relative '../elements/screen_box.rb'

#require_relative 'energy-work-power-screens/gravitational_potential_energy_screen.rb'
#require_relative 'momentum-impulse-screens/impulse_v1_screen.rb'
#require_relative 'momentum-impulse-screens/impulse_v2_screen.rb'

# Object definition
class EnergyWorkPowerScreen < Shoes

  url('/title_screen/energy_work_power_screen',
      :energy_work_power_screen)

  def energy_work_power_screen
    @heading = 'Energy, work & power'
    @heading_edited = @heading.downcase.gsub(/[,&]/,'').squeeze(' ').gsub(' ','_')
    background("../images/#{@heading_edited}_large.png")

    # Energy work power screen header
    ScreenHeader.new(self, '/title_screen', @@font, @heading)

    # Energy work power screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:height => 640, :width => 80) do
      end
      # Content column
      stack(:height => 640, :width => 1000) do
        @formula_set =
          {'Gravitational potential energy' => 'Gravitational potential energy = mass x acceleration of free fall x height'}
        @formula_set.each do |name, formula|
          ScreenBox.new(self, @@theme_colour, @@font, @heading, formula, name)
        end

        stack(:height => 100, :width => 940, :margin => 2) do
          background(@@theme_colour)
          @elastic_potential_energy = para('Elastic potential energy = 0.5 x spring constant x extension', sup('2'))
          @elastic_potential_energy.style(@@screen_box_text_styles)
          click do
            visit("/title_screen/#{@heading_edited}_screen/elastic_potential_energy_screen")
          end
        end
      end
    end
  end

end
