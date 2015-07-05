#==============================================================================
# Watts
#
# @description: Module for providing functions to work with EnergyV4Screen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Energy v4 screen module (energy_v4_screen.rb)

require_relative '../../elements/screen_label.rb'
require_relative '../../elements/screen_edit_line.rb'

# Object definition
class EnergyV4Screen < Shoes

  url('/title_screen/quantum_screen/energy_v4_screen',
      :energy_v4_screen)

  # Draws the energy v4 screen on the Shoes app window.
  def energy_v4_screen
    background('images/quantum_large.png')

    # Energy v4 screen header
    flow(:height => 80, :width => 1080, :scroll => false) do
      @back_button = image('images/back_icon_white.png',
                           :click => '/title_screen/quantum_screen')
      @heading = title('Energy = mass × speed of light', sup('2'))
      @back_button.style(@@screen_header_image_styles)
      @heading.style(@@screen_header_text_styles)
    end

    # Energy v4 screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:height => 640, :width => 80) do
      end
      # Content column
      stack(:height => 640, :width => 1000) do
        @heading_edited = @heading.text
        ScreenLabel.new(self, @@font, @heading_edited, 'Mass')
        flow do
          @mass = ScreenEditLine.new(self, @@font, @heading_edited)
          @mass_unit = para(strong(' kg'))
          @mass_unit.style(@@screen_unit_text_styles)
        end

        @calculate = button('Calculate')

        @result_display = flow

        @error_display = flow

        @calculate.click do
          @result_display.clear do
            @result = Joules.energy_v4(@mass.text.to_f)
            @energy_v4 = para(@result.to_s)
            @energy_v4_unit = para(' J')
            @energy_v4.style(@@screen_result_text_styles)
            @energy_v4_unit.style(@@screen_result_text_styles)
          end
        end
      end
    end
  end

end
