#==============================================================================
# Watts
#
# @description: Module for providing functions to work with CircumferenceScreen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Circumference screen module (circumference_screen.rb)

require_relative '../../elements/screen_header.rb'
require_relative '../../elements/screen_label.rb'
require_relative '../../elements/screen_edit_line.rb'

# Object definition
class CircumferenceScreen < Shoes

  url('/title_screen/geometry_screen/circumference_screen',
      :circumference_screen)

  # Draws the circumference screen on the Shoes app window.
  def circumference_screen
    @heading = 'Circumference = 2π × radius'
    background('images/geometry_large.png')

    # Circumference screen header
    ScreenHeader.new(self, '/title_screen/geometry_screen', @@font, @heading)

    # Circumference screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:height => 640, :width => 80) do
      end
      # Content column
      stack(:height => 640, :width => 1000) do
        ScreenLabel.new(self, @@font, @heading, 'Radius')
        flow do
          @radius = ScreenEditLine.new(self, @@font, @heading)
          @radius_units = ['cm', 'm', 'km', 'in', 'ft', 'yd', 'mi']
          @radius_unit = list_box(:width => 100,
                                  :font => @@font,
                                  :items => @radius_units)
        end

        @calculate = button('Calculate')

        @result_display = flow

        @error_display = flow

        @calculate.click do
          @result_display.clear do
            @result = Joules.circumference(@radius.text.to_f)
            @circumference = para(@result.to_s)
            @circumference_unit = para(" #{@radius_unit.text}")
            @circumference.style(@@screen_result_text_styles)
            @circumference_unit.style(@@screen_result_text_styles)
          end
        end
      end
    end
  end

end
