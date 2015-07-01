#==============================================================================
# Watts
#
# @description: Module for providing functions to work with PressureSubScreen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Pressure sub screen module (pressure_sub_screen.rb)

require_relative '../../elements/screen_header.rb'
require_relative '../../elements/screen_label.rb'
require_relative '../../elements/screen_edit_line.rb'

# Object definition
class PressureSubScreen < Shoes

  url('/title_screen/pressure_screen/pressure_sub_screen',
      :pressure_sub_screen)

  # Draws the pressure sub screen on the Shoes app window.
  def pressure_sub_screen
    @heading = 'Pressure = force / area'
    background('images/pressure_large.png')

    # Pressure sub screen header
    ScreenHeader.new(self, '/title_screen/pressure_screen', @@font, @heading)

    # Pressure sub screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:height => 640, :width => 80) do
      end
      # Content column
      stack(:height => 640, :width => 1000) do
        ScreenLabel.new(self, @@font, @heading, 'Force')
        flow do
          @force = ScreenEditLine.new(self, @@font, @heading)
          @force_unit = para(strong(' N'))
          @force_unit.style(@@screen_unit_text_styles)
        end

        ScreenLabel.new(self, @@font, @heading, 'Area')
        flow do
          @area = ScreenEditLine.new(self, @@font, @heading)
          @area_unit = para(strong(' m'), strong(sup('2')))
          @area_unit.style(@@screen_unit_text_styles)
        end

        @calculate = button('Calculate')

        @result_display = flow

        @error_display = flow

        @calculate.click do
          @result_display.clear do
            @result = Joules.pressure(@force.text.to_f,
                                      @area.text.to_f)
            @pressure = para(@result.to_s)
            @pressure_unit = para(' Pa')
            @pressure.style(@@screen_result_text_styles)
            @pressure_unit.style(@@screen_result_text_styles)
          end
        end
      end
    end
  end

end
