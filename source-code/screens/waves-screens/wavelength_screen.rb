#==============================================================================
# Watts
#
# @description: Module for providing functions to work with WavelengthScreen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Wavelength screen module (wavelength_screen.rb)

require_relative '../../elements/screen_header.rb'
require_relative '../../elements/screen_label.rb'
require_relative '../../elements/screen_edit_line.rb'

# Object definition
class WavelengthScreen < Shoes

  url('/title_screen/waves_screen/wavelength_screen',
      :wavelength_screen)

  # Draws the wavelength screen on the Shoes app window.
  def wavelength_screen
    @heading = 'Wavelength = wave speed / frequency'
    background('images/waves_large.png')

    # Wavelength screen header
    ScreenHeader.new(self, '/title_screen/waves_screen', @@font, @heading)

    # Wavelength screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:height => 640, :width => 80) do
      end
      # Content column
      stack(:height => 640, :width => 1000) do
        ScreenLabel.new(self, @@font, @heading, 'Wave speed')
        flow do
          @wave_speed = ScreenEditLine.new(self, @@font, @heading)
          @wave_speed_unit = para(strong(' ms'), strong(sup('-1')))
          @wave_speed_unit.style(@@screen_unit_text_styles)
        end

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
            @result = Joules.wavelength(@wave_speed.text.to_f,
                                        @frequency.text.to_f)
            @wavelength = para(@result.to_s)
            @wavelength_unit = para(' m')
            @wavelength.style(@@screen_result_text_styles)
            @wavelength_unit.style(@@screen_result_text_styles)
          end
        end
      end
    end
  end

end
