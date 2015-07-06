#==============================================================================
# Watts
#
# @description: Module for providing functions to work with DegreesScreen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Degrees screen module (degrees_screen.rb)

require_relative '../../elements/screen_header.rb'
require_relative '../../elements/screen_label.rb'
require_relative '../../elements/screen_edit_line.rb'

# Object definition
class DegreesScreen < Shoes

  url('/title_screen/conversions_screen/degrees_screen',
      :degrees_screen)

  # Draws the degrees screen on the Shoes app window.
  def degrees_screen
    @heading = 'Degrees = (angle × 180) / π'
    background('images/conversions_large.png')

    # Degrees screen header
    ScreenHeader.new(self, '/title_screen/conversions_screen', @@font, @heading)

    # Degrees screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:height => 640, :width => 80) do
      end
      # Content column
      stack(:height => 640, :width => 1000) do
        ScreenLabel.new(self, @@font, @heading, 'Angle')
        flow do
          @angle = ScreenEditLine.new(self, @@font, @heading)
          @angle_unit = para(strong(' rad'))
          @angle_unit.style(@@screen_unit_text_styles)
        end

        @calculate = button('Calculate')

        @result_display = flow

        @error_display = flow

        @calculate.click do
          @result_display.clear do
            @result = Joules.to_degrees(@angle.text.to_f)
            @degrees = para(@result.to_s)
            @degrees_unit = para(' deg')
            @degrees.style(@@screen_result_text_styles)
            @degrees_unit.style(@@screen_result_text_styles)
          end
        end
      end
    end
  end

end
