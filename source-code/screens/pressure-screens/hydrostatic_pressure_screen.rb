#==============================================================================
# Watts
#
# @description: Module for providing functions to work with HydrostaticPressureScreen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Hydrostatic pressure screen module (hydrostatic_pressure_screen.rb)

require_relative '../../elements/screen_header.rb'
require_relative '../../elements/screen_label.rb'
require_relative '../../elements/screen_edit_line.rb'

# Object definition
class HydrostaticPressureScreen < Shoes

  url('/title_screen/pressure_screen/hydrostatic_pressure_screen',
      :hydrostatic_pressure_screen)

  # Draws the hydrostatic pressure screen on the Shoes app window.
  def hydrostatic_pressure_screen
    @heading = 'Hydrostatic pressure = density x acceleration of free fall x height'
    background('images/pressure_large.png')

    # Hydrostatic pressure screen header
    ScreenHeader.new(self, '/title_screen/pressure_screen', @@font, @heading)

    # Hydrostatic pressure screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:height => 640, :width => 80) do
      end
      # Content column
      stack(:height => 640, :width => 1000) do
        ScreenLabel.new(self, @@font, @heading, 'Density')
        flow do
          @density = ScreenEditLine.new(self, @@font, @heading)
          @density_unit = para(strong(' kgm'), strong(sup('-3')))
          @density_unit.style(@@screen_unit_text_styles)
        end

        ScreenLabel.new(self, @@font, @heading, 'Height')
        flow do
          @height = ScreenEditLine.new(self, @@font, @heading)
          @height_unit = para(strong(' m'))
          @height_unit.style(@@screen_unit_text_styles)
        end

        @calculate = button('Calculate')

        @result_display = flow

        @error_display = flow

        @calculate.click do
          @result_display.clear do
            @result = Joules.hydrostatic_pressure(@density.text.to_f,
                                                  @height.text.to_f)
            @hydrostatic_pressure = para(@result.to_s)
            @hydrostatic_pressure_unit = para(' Pa')
            @hydrostatic_pressure.style(@@screen_result_text_styles)
            @hydrostatic_pressure_unit.style(@@screen_result_text_styles)
          end
        end
      end
    end
  end

end
