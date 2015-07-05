#==============================================================================
# Watts
#
# @description: Module for providing functions to work with TimePeriodV2Screen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Time period v2 screen module (time_period_v2_screen.rb)

require_relative '../../elements/screen_label.rb'
require_relative '../../elements/screen_edit_line.rb'

# Object definition
class TimePeriodV2Screen < Shoes

  url('/title_screen/oscillations_screen/time_period_v2_screen',
      :time_period_v2_screen)

  # Draws the time period v2 screen on the Shoes app window.
  def time_period_v2_screen
    background('images/oscillations_large.png')

    # Time period v2 screen header
    flow(:height => 80, :width => 1080, :scroll => false) do
      @back_button = image('images/back_icon_white.png',
                           :click => '/title_screen/oscillations_screen')
      @heading = title('Time period = 2π x (mass / spring constant)', sup('0.5'))
      @back_button.style(@@screen_header_image_styles)
      @heading.style(@@screen_header_text_styles)
    end

    # Time period v2 screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:height => 640, :width => 80) do
      end
      # Content column
      stack(:height => 640, :width => 1000) do
        @heading_edited = @heading.text
        ScreenLabel.new(self, @@font, @heading_edited, 'Mass')
        flow do
          @mass = ScreenEditLine.new(self, @@font, @heading_edited)
          @mass_unit = para(strong(' kg'))
          @mass_unit.style(@@screen_unit_text_styles)
        end

        ScreenLabel.new(self, @@font, @heading_edited, 'Spring constant')
        flow do
          @spring_constant = ScreenEditLine.new(self, @@font, @heading_edited)
          @spring_constant_unit = para(strong(' Nm'), strong(sup('-1')))
          @spring_constant_unit.style(@@screen_unit_text_styles)
        end

        @calculate = button('Calculate')

        @result_display = flow

        @error_display = flow

        @calculate.click do
          @result_display.clear do
            @result = Joules.time_period_v2(@mass.text.to_f,
                                            @spring_constant.text.to_f)
            @time_period_v2 = para(@result.to_s)
            @time_period_v2_unit = para(' s')
            @time_period_v2.style(@@screen_result_text_styles)
            @time_period_v2_unit.style(@@screen_result_text_styles)
          end
        end
      end
    end
  end

end
