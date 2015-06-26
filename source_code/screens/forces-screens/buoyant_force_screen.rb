#==============================================================================
# Watts
#
# @description: Module for providing functions to work with BuoyantForceScreen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Buoyant force screen module (buoyant_force_screen.rb)

require_relative '../../elements/screen_header.rb'
require_relative '../../elements/screen_label.rb'
require_relative '../../elements/screen_edit_line.rb'

# Object definition
class BuoyantForceScreen < Shoes

  url('/title_screen/forces_screen/buoyant_force_screen',
      :buoyant_force_screen)

  # Draws the buoyant force screen on the Shoes app window.
  def buoyant_force_screen
    @heading = 'Buoyant force = density x acceleration of free fall x volume of liquid displaced'
    background('../images/forces_large.png')

    # Buoyant force screen header
    ScreenHeader.new(self, '/title_screen/forces_screen', @@font, @heading)

    # Buoyant force screen content
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

        ScreenLabel.new(self, @@font, @heading, 'Volume of liquid displaced')
        flow do
          @volume_of_liquid_displaced = ScreenEditLine.new(self, @@font, @heading)
          @volume_of_liquid_displaced_unit = para(strong(' m'), strong(sup('3')))
          @volume_of_liquid_displaced_unit.style(@@screen_unit_text_styles)
        end

        @calculate = button('Calculate')

        @result_display = flow

        @error_display = flow

        @calculate.click do
          @result_display.clear do
            @result = Joules.buoyant_force(@density.text.to_f,
                                           @volume_of_liquid_displaced.text.to_f)
            @buoyant_force = para(@result.to_s)
            @buoyant_force_unit = para(' N')
            @buoyant_force.style(@@screen_result_text_styles)
            @buoyant_force_unit.style(@@screen_result_text_styles)
          end
        end
      end
    end
  end

end
