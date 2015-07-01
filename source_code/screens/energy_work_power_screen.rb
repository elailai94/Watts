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

require_relative 'energy-work-power-screens/gravitational_potential_energy_screen.rb'
require_relative 'energy-work-power-screens/elastic_potential_energy_screen.rb'
require_relative 'energy-work-power-screens/kinetic_energy_v1_screen.rb'
require_relative 'energy-work-power-screens/work_done_screen.rb'
require_relative 'energy-work-power-screens/power_v1_screen.rb'
require_relative 'energy-work-power-screens/power_v2_screen.rb'

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
      stack(:height => 850, :width => 80) do
      end
      # Content column
      stack(:height => 850, :width => 1000) do
        @formula_set =
          {'Gravitational potential energy' => 'Gravitational potential energy = mass x acceleration of free fall x height'}
        @formula_set.each do |name, formula|
          ScreenBox.new(self, @@theme_colour, @@font, @heading, formula, name)
        end

        stack(:height => 100, :width => 940, :margin => 2) do
          background(@@theme_colour)
          @elastic_potential_energy = para('Elastic potential energy = 0.5 x spring constant x extension',
                                           sup('2'))
          @elastic_potential_energy.style(@@screen_box_text_styles)
          click do
            visit("/title_screen/#{@heading_edited}_screen/elastic_potential_energy_screen")
          end
        end

        stack(:height => 100, :width => 940, :margin => 2) do
          background(@@theme_colour)
          @kinetic_energy_v1 = para('Kinetic energy = 0.5 x mass x velocity', sup('2'))
          @kinetic_energy_v1.style(@@screen_box_text_styles)
          click do
            visit("/title_screen/#{@heading_edited}_screen/kinetic_energy_v1_screen")
          end
        end

        stack(:height => 100, :width => 940, :margin => 2) do
          background(@@theme_colour)
          @work_done = para('Work done = force x displacement x cosine(angle)')
          @work_done.style(@@screen_box_text_styles)
          click do
            visit("/title_screen/#{@heading_edited}_screen/work_done_screen")
          end
        end

        stack(:height => 100, :width => 940, :margin => 2) do
          background(@@theme_colour)
          @power_v1 = para('Power = work done / time')
          @power_v1.style(@@screen_box_text_styles)
          click do
            visit("/title_screen/#{@heading_edited}_screen/power_v1_screen")
          end
        end

        stack(:height => 100, :width => 940, :margin => 2) do
          background(@@theme_colour)
          @power_v2 = para('Power = force x velocity x cosine(angle)')
          @power_v2.style(@@screen_box_text_styles)
          click do
            visit("/title_screen/#{@heading_edited}_screen/power_v2_screen")
          end
        end

        stack(:height => 100, :width => 940, :margin => 2) do
          background(@@theme_colour)
          @energy_efficiency = para('Energy efficiency = (useful energy output / energy input) x 100')
          @energy_efficiency.style(@@screen_box_text_styles)
          click do
            visit("/title_screen/#{@heading_edited}_screen/energy_efficiency_screen")
          end
        end

        stack(:height => 100, :width => 940, :margin => 2) do
          background(@@theme_colour)
          @power_efficiency = para('Power efficiency = (useful power output / power input) x 100')
          @power_efficiency.style(@@screen_box_text_styles)
          click do
            visit("/title_screen/#{@heading_edited}_screen/power_efficiency_screen")
          end
        end
      end
    end
  end

end
