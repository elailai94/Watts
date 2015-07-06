#==============================================================================
# Watts
#
# @description: Module for providing functions to work with MetresPerSecondScreen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Metres per second screen module (metres_per_second_screen.rb)

require_relative '../../elements/screen_header.rb'
require_relative '../../elements/screen_label.rb'
require_relative '../../elements/screen_edit_line.rb'

# Object definition
class MetresPerSecondScreen < Shoes

  url('/title_screen/conversions_screen/metres_per_second_screen',
      :metres_per_second_screen)

  # Draws the metres per second screen on the Shoes app window.
  def metres_per_second_screen
    @heading = 'Metres per second = (velocity × 1000) / 3600'
    background('images/conversions_large.png')

    # Metres per second screen header
    ScreenHeader.new(self, '/title_screen/conversions_screen', @@font, @heading)

    # Metres per second screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:height => 640, :width => 80) do
      end
      # Content column
      stack(:height => 640, :width => 1000) do
        ScreenLabel.new(self, @@font, @heading, 'Velocity')
        flow do
          @velocity = ScreenEditLine.new(self, @@font, @heading)
          @velocity_unit = para(strong(' kmh'), strong(sup('-1')))
          @velocity_unit.style(@@screen_unit_text_styles)
        end

        @calculate = button('Calculate')

        @result_display = flow

        @error_display = flow

        @calculate.click do
          @result_display.clear do
            @result = Joules.to_metres_per_second(@velocity.text.to_f)
            @metres_per_second = para(@result.to_s)
            @metres_per_second_unit = para(' ms', sup('-1'))
            @metres_per_second.style(@@screen_result_text_styles)
            @metres_per_second_unit.style(@@screen_result_text_styles)
          end
        end
      end
    end
  end

end
