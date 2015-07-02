#==============================================================================
# Watts
#
# @description: Module for providing functions to work with FrequencyV2Screen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Frequency v2 screen module (frequency_v2_screen.rb)

require_relative '../../elements/screen_header.rb'
require_relative '../../elements/screen_label.rb'
require_relative '../../elements/screen_edit_line.rb'

# Object definition
class FrequencyV2Screen < Shoes

  url('/title_screen/waves_screen/frequency_v2_screen',
      :frequency_v2_screen)

  # Draws the frequency v2 screen on the Shoes app window.
  def frequency_v2_screen
    @heading = 'Frequency = 1 / time period'
    background('images/waves_large.png')

    # Frequency v2 screen header
    ScreenHeader.new(self, '/title_screen/waves_screen', @@font, @heading)

    # Frequency v2 screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:height => 640, :width => 80) do
      end
      # Content column
      stack(:height => 640, :width => 1000) do
        ScreenLabel.new(self, @@font, @heading, 'Time period')
        flow do
          @time_period = ScreenEditLine.new(self, @@font, @heading)
          @time_period_unit = para(strong(' s'))
          @time_period_unit.style(@@screen_unit_text_styles)
        end

        @calculate = button('Calculate')

        @result_display = flow

        @error_display = flow

        @calculate.click do
          @result_display.clear do
            @result = Joules.frequency_v2(@time_period.text.to_f)
            @frequency_v2 = para(@result.to_s)
            @frequency_v2_unit = para(' Hz')
            @frequency_v2.style(@@screen_result_text_styles)
            @frequency_v2_unit.style(@@screen_result_text_styles)
          end
        end
      end
    end
  end

end
