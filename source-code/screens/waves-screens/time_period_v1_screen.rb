#==============================================================================
# Watts
#
# @description: Module for providing functions to work with TimePeriodV1Screen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Time period v1 screen module (time_period_v1_screen.rb)

require_relative '../../elements/screen_header.rb'
require_relative '../../elements/screen_label.rb'
require_relative '../../elements/screen_edit_line.rb'

# Object definition
class TimePeriodV1Screen < Shoes

  url('/title_screen/waves_screen/time_period_v1_screen',
      :time_period_v1_screen)

  # Draws the time period v1 screen on the Shoes app window.
  def time_period_v1_screen
    @heading = 'Time period = 1 / frequency'
    background('images/waves_large.png')

    # Time period v1 screen header
    ScreenHeader.new(self, '/title_screen/waves_screen', @@font, @heading)

    # Time period v1 screen content
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
            @result = Joules.time_period_v1(@frequency.text.to_f)
            @time_period_v1 = para(@result.to_s)
            @time_period_v1_unit = para(' s')
            @time_period_v1.style(@@screen_result_text_styles)
            @time_period_v1_unit.style(@@screen_result_text_styles)
          end
        end
      end
    end
  end

end
