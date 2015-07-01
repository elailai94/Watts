#==============================================================================
# Watts
#
# @description: Module for providing functions to work with DensitySubScreen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Density sub screen module (density_sub_screen.rb)

require_relative '../../elements/screen_header.rb'
require_relative '../../elements/screen_label.rb'
require_relative '../../elements/screen_edit_line.rb'

# Object definition
class DensitySubScreen < Shoes

  url('/title_screen/density_screen/density_sub_screen',
      :density_sub_screen)

  # Draws the density sub screen on the Shoes app window.
  def density_sub_screen
    @heading = 'Density = mass / volume'
    background('images/density_large.png')

    # Density sub screen header
    ScreenHeader.new(self, '/title_screen/density_screen', @@font, @heading)

    # Density sub screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:height => 640, :width => 80) do
      end
      # Content column
      stack(:height => 640, :width => 1000) do
        ScreenLabel.new(self, @@font, @heading, 'Mass')
        flow do
          @mass = ScreenEditLine.new(self, @@font, @heading)
          @mass_unit = para(strong(' kg'))
          @mass_unit.style(@@screen_unit_text_styles)
        end

        ScreenLabel.new(self, @@font, @heading, 'Volume')
        flow do
          @volume = ScreenEditLine.new(self, @@font, @heading)
          @volume_unit = para(strong(' m'), strong(sup('3')))
          @volume_unit.style(@@screen_unit_text_styles)
        end

        @calculate = button('Calculate')

        @result_display = flow

        @error_display = flow

        @calculate.click do
          @result_display.clear do
            @result = Joules.density(@mass.text.to_f,
                                     @volume.text.to_f)
            @density = para(@result.to_s)
            @density_unit = para(' kgm', sup('-3'))
            @density.style(@@screen_result_text_styles)
            @density_unit.style(@@screen_result_text_styles)
          end
        end
      end
    end
  end

end
