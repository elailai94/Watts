#==============================================================================
# Watts
#
# @description: Module for providing functions to work with PowerOfLensScreen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Power of lens screen module (power_of_lens_screen.rb)

require_relative '../../elements/screen_header.rb'
require_relative '../../elements/screen_label.rb'
require_relative '../../elements/screen_edit_line.rb'

# Object definition
class PowerOfLensScreen < Shoes

  url('/title_screen/waves_screen/power_of_lens_screen',
      :power_of_lens_screen)

  # Draws the power of lens screen on the Shoes app window.
  def power_of_lens_screen
    @heading = 'Power of lens = 1 / focal length'
    background('images/waves_large.png')

    # Power of lens screen header
    ScreenHeader.new(self, '/title_screen/waves_screen', @@font, @heading)

    # Power of lens screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:height => 640, :width => 80) do
      end
      # Content column
      stack(:height => 640, :width => 1000) do
        ScreenLabel.new(self, @@font, @heading, 'Focal length')
        flow do
          @focal_length = ScreenEditLine.new(self, @@font, @heading)
          @focal_length_unit = para(strong(' m'))
          @focal_length_unit.style(@@screen_unit_text_styles)
        end

        @calculate = button('Calculate')

        @result_display = flow

        @error_display = flow

        @calculate.click do
          @result_display.clear do
            @result = Joules.power_of_lens(@focal_length.text.to_f)
            @power_of_lens = para(@result.to_s)
            @power_of_lens_unit = para(' D')
            @power_of_lens.style(@@screen_result_text_styles)
            @power_of_lens_unit.style(@@screen_result_text_styles)
          end
        end
      end
    end
  end

end
