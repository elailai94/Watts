#==============================================================================
# Watts
#
# @description: Module for providing functions to work with KelvinsScreen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Kelvins screen module (kelvins_screen.rb)

require_relative '../../elements/screen_header.rb'
require_relative '../../elements/screen_label.rb'
require_relative '../../elements/screen_edit_line.rb'

# Object definition
class KelvinsScreen < Shoes

  url('/title_screen/conversions_screen/kelvins_screen',
      :kelvins_screen)

  # Draws the kelvins screen on the Shoes app window.
  def kelvins_screen
    @heading = 'Kelvins = temperature + 273.15'
    background('images/conversions_large.png')

    # Kelvins screen header
    ScreenHeader.new(self, '/title_screen/conversions_screen', @@font, @heading)

    # Kelvins screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:height => 640, :width => 80) do
      end
      # Content column
      stack(:height => 640, :width => 1000) do
        ScreenLabel.new(self, @@font, @heading, 'Temperature')
        flow do
          @temperature = ScreenEditLine.new(self, @@font, @heading)
          @temperature_unit = para(strong(' °C'))
          @temperature_unit.style(@@screen_unit_text_styles)
        end

        @calculate = button('Calculate')

        @result_display = flow

        @error_display = flow

        @calculate.click do
          @result_display.clear do
            @result = Joules.to_kelvins(@temperature.text.to_f)
            @kelvins = para(@result.to_s)
            @kelvins_unit = para(' K')
            @kelvins.style(@@screen_result_text_styles)
            @kelvins_unit.style(@@screen_result_text_styles)
          end
        end
      end
    end
  end

end
