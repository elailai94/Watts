#==============================================================================
# Watts
#
# @description: Module for providing functions to work with RadiansScreen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Radians screen module (radians_screen.rb)

require_relative '../../elements/screen_header.rb'
require_relative '../../elements/screen_label.rb'
require_relative '../../elements/screen_edit_line.rb'

# Object definition
class RadiansScreen < Shoes

  url('/title_screen/conversions_screen/radians_screen',
      :radians_screen)

  # Draws the radians screen on the Shoes app window.
  def radians_screen
    @heading = 'Radians = (angle × π) / 180'
    background('images/conversions_large.png')

    # Radians screen header
    ScreenHeader.new(self, '/title_screen/conversions_screen', @@font, @heading)

    # Radians screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:height => 640, :width => 80) do
      end
      # Content column
      stack(:height => 640, :width => 1000) do
        ScreenLabel.new(self, @@font, @heading, 'Angle')
        flow do
          @angle = ScreenEditLine.new(self, @@font, @heading)
          @angle_unit = para(strong(' deg'))
          @angle_unit.style(@@screen_unit_text_styles)
        end

        @calculate = button('Calculate')

        @result_display = flow

        @error_display = flow

        @calculate.click do
          @result_display.clear do
            @result = Joules.to_radians(@angle.text.to_f)
            @radians = para(@result.to_s)
            @radians_unit = para(' rad')
            @radians.style(@@screen_result_text_styles)
            @radians_unit.style(@@screen_result_text_styles)
          end
        end
      end
    end
  end

end
