#==============================================================================
# Watts
#
# @description: Module for providing functions to work with WaveSpeedScreen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Wave speed screen module (wave_speed_screen.rb)

require_relative '../../elements/screen_header.rb'
require_relative '../../elements/screen_label.rb'
require_relative '../../elements/screen_edit_line.rb'

# Object definition
class WaveSpeedScreen < Shoes

  url('/title_screen/waves_screen/wave_speed_screen',
      :wave_speed_screen)

  # Draws the wave speed screen on the Shoes app window.
  def wave_speed_screen
    @heading = 'Wave speed = frequency x wavelength'
    background('images/waves_large.png')

    # Wave speed screen header
    ScreenHeader.new(self, '/title_screen/waves_screen', @@font, @heading)

    # Wave speed screen content
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
            @result = Joules.wave_speed(@frequency.text.to_f,
                                        @wavelength.text.to_f)
            @wave_speed = para(@result.to_s)
            @wave_speed_unit = para(' ms', sup('-1'))
            @wave_speed.style(@@screen_result_text_styles)
            @wave_speed_unit.style(@@screen_result_text_styles)
          end
        end
      end
    end
  end

end
