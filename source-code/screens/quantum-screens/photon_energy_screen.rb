#==============================================================================
# Watts
#
# @description: Module for providing functions to work with PhotonEnergyScreen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Photon energy screen module (photon_energy_screen.rb)

require_relative '../../elements/screen_header.rb'
require_relative '../../elements/screen_label.rb'
require_relative '../../elements/screen_edit_line.rb'

# Object definition
class PhotonEnergyScreen < Shoes

  url('/title_screen/quantum_screen/photon_energy_screen',
      :photon_energy_screen)

  # Draws the photon energy screen on the Shoes app window.
  def photon_energy_screen
    @heading = 'Photon energy = planck constant × frequency'
    background('images/quantum_large.png')

    # Photon energy screen header
    ScreenHeader.new(self, '/title_screen/quantum_screen', @@font, @heading)

    # Photon energy screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:height => 640, :width => 80) do
      end
      # Content column
      stack(:height => 640, :width => 1000) do
        ScreenLabel.new(self, @@font, @heading, 'Frequency')
        flow do
          @frequency = ScreenEditLine.new(self, @@font, @heading)
          @frequency_unit = para(strong(' Hz'))
          @frequency_unit.style(@@screen_unit_text_styles)
        end

        @calculate = button('Calculate')

        @result_display = flow

        @error_display = flow

        @calculate.click do
          @result_display.clear do
            @result = Joules.photon_energy(@frequency.text.to_f)
            @photon_energy = para(@result.to_s)
            @photon_energy_unit = para(' J')
            @photon_energy.style(@@screen_result_text_styles)
            @photon_energy_unit.style(@@screen_result_text_styles)
          end
        end
      end
    end
  end

end
