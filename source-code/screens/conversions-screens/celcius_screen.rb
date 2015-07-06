#==============================================================================
# Watts
#
# @description: Module for providing functions to work with CelciusScreen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Celcius screen module (celcius_screen.rb)

require_relative '../../elements/screen_header.rb'
require_relative '../../elements/screen_label.rb'
require_relative '../../elements/screen_edit_line.rb'

# Object definition
class CelciusScreen < Shoes

  url('/title_screen/conversions_screen/celcius_screen',
      :celcius_screen)

  # Draws the celcius screen on the Shoes app window.
  def celcius_screen
    @heading = 'Celcius = temperature - 273.15'
    background('images/conversions_large.png')

    # Celcius screen header
    ScreenHeader.new(self, '/title_screen/conversions_screen', @@font, @heading)

    # Celcius screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:height => 640, :width => 80) do
      end
      # Content column
      stack(:height => 640, :width => 1000) do
        ScreenLabel.new(self, @@font, @heading, 'Temperature')
        flow do
          @temperature = ScreenEditLine.new(self, @@font, @heading)
          @temperature_unit = para(strong(' K'))
          @temperature_unit.style(@@screen_unit_text_styles)
        end

        @calculate = button('Calculate')

        @result_display = flow

        @error_display = flow

        @calculate.click do
          @result_display.clear do
            @result = Joules.to_celcius(@temperature.text.to_f)
            @celcius = para(@result.to_s)
            @celcius_unit = para(' °C')
            @celcius.style(@@screen_result_text_styles)
            @celcius_unit.style(@@screen_result_text_styles)
          end
        end
      end
    end
  end

end
