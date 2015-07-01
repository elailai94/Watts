#==============================================================================
# Watts
#
# @description: Module for providing functions to work with YoungModulusScreen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Young modulus screen module (young_modulus_screen.rb)

require_relative '../../elements/screen_header.rb'
require_relative '../../elements/screen_label.rb'
require_relative '../../elements/screen_edit_line.rb'

# Object definition
class YoungModulusScreen < Shoes

  url('/title_screen/stress_strain_screen/young_modulus_screen',
      :young_modulus_screen)

  # Draws the young modulus screen on the Shoes app window.
  def young_modulus_screen
    @heading = 'Young modulus = tensile stress / tensile strain'
    background('images/stress_strain_large.png')

    # Young modulus screen header
    ScreenHeader.new(self, '/title_screen/stress_strain_screen', @@font, @heading)

    # Young modulus screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:height => 640, :width => 80) do
      end
      # Content column
      stack(:height => 640, :width => 1000) do
        ScreenLabel.new(self, @@font, @heading, 'Tensile stress')
        flow do
          @tensile_stress = ScreenEditLine.new(self, @@font, @heading)
          @tensile_stress_unit = para(strong(' Pa'))
          @tensile_stress_unit.style(@@screen_unit_text_styles)
        end

        ScreenLabel.new(self, @@font, @heading, 'Tensile strain')
        flow do
          @tensile_strain = ScreenEditLine.new(self, @@font, @heading)
        end

        @calculate = button('Calculate')

        @result_display = flow

        @error_display = flow

        @calculate.click do
          @result_display.clear do
            @result = Joules.young_modulus(@tensile_stress.text.to_f,
                                           @tensile_strain.text.to_f)
            @young_modulus = para(@result.to_s)
            @young_modulus.style(@@screen_result_text_styles)
          end
        end
      end
    end
  end

end
