#==============================================================================
# Watts
#
# @description: Module for providing functions to work with PowerV1Screen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Power v1 screen module (power_v1_screen.rb)

require_relative '../../elements/screen_header.rb'
require_relative '../../elements/screen_label.rb'
require_relative '../../elements/screen_edit_line.rb'

# Object definition
class PowerV1Screen < Shoes

  url('/title_screen/energy_work_power_screen/power_v1_screen',
      :power_v1_screen)

  # Draws the power v1 screen on the Shoes app window.
  def power_v1_screen
    @heading = 'Power = work done / time'
    background('../images/energy_work_power_large.png')

    # Power v1 screen header
    ScreenHeader.new(self, '/title_screen/energy_work_power_screen', @@font, @heading)

    # Power v1 screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:height => 640, :width => 80) do
      end
      # Content column
      stack(:height => 640, :width => 1000) do
        ScreenLabel.new(self, @@font, @heading, 'Work done')
        flow do
          @work_done = ScreenEditLine.new(self, @@font, @heading)
          @work_done_unit = para(strong(' J'))
          @work_done_unit.style(@@screen_unit_text_styles)
        end

        ScreenLabel.new(self, @@font, @heading, 'Time')
        flow do
          @time = ScreenEditLine.new(self, @@font, @heading)
          @time_unit = para(strong(' s'))
          @time_unit.style(@@screen_unit_text_styles)
        end

        @calculate = button('Calculate')

        @result_display = flow

        @error_display = flow

        @calculate.click do
          @result_display.clear do
            @result = Joules.power_v1(@work_done.text.to_f,
                                      @time.text.to_f)
            @power_v1 = para(@result.to_s)
            @power_v1_unit = para(' W')
            @power_v1.style(@@screen_result_text_styles)
            @power_v1_unit.style(@@screen_result_text_styles)
          end
        end
      end
    end
  end

end
