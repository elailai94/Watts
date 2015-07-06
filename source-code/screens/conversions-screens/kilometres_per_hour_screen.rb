#==============================================================================
# Watts
#
# @description: Module for providing functions to work with KilometresPerHourScreen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Kilometres per hour screen module (kilometres_per_hour_screen.rb)

require_relative '../../elements/screen_header.rb'
require_relative '../../elements/screen_label.rb'
require_relative '../../elements/screen_edit_line.rb'

# Object definition
class KilometresPerHourScreen < Shoes

  url('/title_screen/conversions_screen/kilometres_per_hour_screen',
      :kilometres_per_hour_screen)

  # Draws the kilometres per hour screen on the Shoes app window.
  def kilometres_per_hour_screen
    @heading = 'Kilometres per hour = (velocity × 3600) / 1000'
    background('images/conversions_large.png')

    # Kilometres per hour screen header
    ScreenHeader.new(self, '/title_screen/conversions_screen', @@font, @heading)

    # Kilometres per hour screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:height => 640, :width => 80) do
      end
      # Content column
      stack(:height => 640, :width => 1000) do
        ScreenLabel.new(self, @@font, @heading, 'Velocity')
        flow do
          @velocity = ScreenEditLine.new(self, @@font, @heading)
          @velocity_unit = para(strong(' ms'), strong(sup('-1')))
          @velocity_unit.style(@@screen_unit_text_styles)
        end

        @calculate = button('Calculate')

        @result_display = flow

        @error_display = flow

        @calculate.click do
          @result_display.clear do
            @result = Joules.to_kilometres_per_hour(@velocity.text.to_f)
            @kilometres_per_hour = para(@result.to_s)
            @kilometres_per_hour_unit = para(' kmh', sup('-1'))
            @kilometres_per_hour.style(@@screen_result_text_styles)
            @kilometres_per_hour_unit.style(@@screen_result_text_styles)
          end
        end
      end
    end
  end

end
