#==============================================================================
# Watts
#
# @description: Module for providing functions to work with FrequencyV1Screen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Frequency v1 screen module (frequency_v1_screen.rb)

require_relative '../../elements/screen_header.rb'
require_relative '../../elements/screen_label.rb'
require_relative '../../elements/screen_edit_line.rb'

# Object definition
class FrequencyV1Screen < Shoes

  url('/title_screen/waves_screen/frequency_v1_screen',
      :frequency_v1_screen)

  # Draws the frequency v1 screen on the Shoes app window.
  def frequency_v1_screen
    @heading = 'Frequency = wave speed / wavelength'
    background('images/waves_large.png')

    # Frequency v1 screen header
    ScreenHeader.new(self, '/title_screen/waves_screen', @@font, @heading)

    # Frequency v1 screen content
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

        ScreenLabel.new(self, @@font, @heading, 'Wavelength')
        flow do
          @wavelength = ScreenEditLine.new(self, @@font, @heading)
          @wavelength_unit = para(strong(' m'))
          @wavelength_unit.style(@@screen_unit_text_styles)
        end

        @calculate = button('Calculate')

        @result_display = flow

        @error_display = flow

        @calculate.click do
          @result_display.clear do
            @result = Joules.frequency_v1(@wave_speed.text.to_f,
                                          @wavelength.text.to_f)
            @frequency_v1 = para(@result.to_s)
            @frequency_v1_unit = para(' Hz')
            @frequency_v1.style(@@screen_result_text_styles)
            @frequency_v1_unit.style(@@screen_result_text_styles)
          end
        end
      end
    end
  end

end
