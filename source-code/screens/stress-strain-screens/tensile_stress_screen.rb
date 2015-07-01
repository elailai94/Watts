#==============================================================================
# Watts
#
# @description: Module for providing functions to work with TensileStressScreen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Tensile stress screen module (tensile_stress_screen.rb)

require_relative '../../elements/screen_header.rb'
require_relative '../../elements/screen_label.rb'
require_relative '../../elements/screen_edit_line.rb'

# Object definition
class TensileStressScreen < Shoes

  url('/title_screen/stress_strain_screen/tensile_stress_screen',
      :tensile_stress_screen)

  # Draws the tensile stress screen on the Shoes app window.
  def tensile_stress_screen
    @heading = 'Tensile stress = force / area'
    background('images/stress_strain_large.png')

    # Tensile stress screen header
    ScreenHeader.new(self, '/title_screen/stress_strain_screen', @@font, @heading)

    # Tensile stress screen content
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
            @result = Joules.tensile_stress(@force.text.to_f,
                                            @area.text.to_f)
            @tensile_stress = para(@result.to_s)
            @tensile_stress_unit = para(' Pa')
            @tensile_stress.style(@@screen_result_text_styles)
            @tensile_stress_unit.style(@@screen_result_text_styles)
          end
        end
      end
    end
  end

end
