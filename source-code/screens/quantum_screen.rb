#==============================================================================
# Watts
#
# @description: Module for providing functions to work with QuantumScreen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Quantum screen module (quantum_screen.rb)

require_relative '../elements/screen_header.rb'
require_relative '../elements/screen_box.rb'

require_relative 'quantum-screens/photon_energy_screen.rb'
require_relative 'quantum-screens/half_life_screen.rb'
require_relative 'quantum-screens/decay_constant_screen.rb'
require_relative 'quantum-screens/energy_v4_screen.rb'

# Object definition
class QuantumScreen < Shoes

  url('/title_screen/quantum_screen',
      :quantum_screen)

  # Draws the quantum screen on the Shoes app window.
  def quantum_screen
    @heading = 'Quantum'
    @heading_edited = @heading.downcase.gsub(/[,&]/,'').squeeze(' ').gsub(' ','_')
    background("images/#{@heading_edited}_large.png")

    # Quantum screen header
    ScreenHeader.new(self, '/title_screen', @@font, @heading)

    # Quantum screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:height => 640, :width => 80) do
      end
      # Content column
      stack(:height => 640, :width => 1000) do
        @formula_set =
          {'Photon energy' => 'Photon energy = planck constant × frequency',
           'Half life' => 'Half life = ln(2) / decay constant',
           'Decay constant' => 'Decay constant = ln(2) / half life'}
        @formula_set.each do |name, formula|
          ScreenBox.new(self, @@theme_colour, @@font, @heading, formula, name)
        end

        stack(:height => 100, :width => 940, :margin => 2) do
          background(@@theme_colour)
          @energy_v4 = para('Energy = mass × speed of light', sup('2'))
          @energy_v4.style(@@screen_box_text_styles)
          click do
            visit("/title_screen/#{@heading_edited}_screen/energy_v4_screen")
          end
        end
      end
    end
  end

end
