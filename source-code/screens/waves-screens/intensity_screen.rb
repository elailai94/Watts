#==============================================================================
# Watts
#
# @description: Module for providing functions to work with IntensityScreen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Intensity screen module (intensity_screen.rb)

require_relative '../../elements/screen_header.rb'
require_relative '../../elements/screen_label.rb'
require_relative '../../elements/screen_edit_line.rb'

# Object definition
class IntensityScreen < Shoes

  url('/title_screen/waves_screen/intensity_screen',
      :intensity_screen)

  # Draws the intensity screen on the Shoes app window.
  def intensity_screen
    @heading = 'Intensity = power / area'
    background('images/waves_large.png')

    # Intensity screen header
    ScreenHeader.new(self, '/title_screen/waves_screen', @@font, @heading)

    # Intensity screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:height => 640, :width => 80) do
      end
      # Content column
      stack(:height => 640, :width => 1000) do
        ScreenLabel.new(self, @@font, @heading, 'Power')
        flow do
          @power = ScreenEditLine.new(self, @@font, @heading)
          @power_unit = para(strong(' W'))
          @power_unit.style(@@screen_unit_text_styles)
        end

        ScreenLabel.new(self, @@font, @heading, 'Area')
        flow do
          @area = ScreenEditLine.new(self, @@font, @heading)
          @area_unit = para(strong(' m'), strong(sup('2')))
          @area_unit.style(@@screen_unit_text_styles)
        end

        @calculate = button('Calculate')

        @result_display = flow

        @error_display = flow

        @calculate.click do
          @result_display.clear do
            @result = Joules.intensity(@power.text.to_f,
                                       @area.text.to_f)
            @intensity = para(@result.to_s)
            @intensity_unit = para(' Wm', sup('-2'))
            @intensity.style(@@screen_result_text_styles)
            @intensity_unit.style(@@screen_result_text_styles)
          end
        end
      end
    end
  end

end
