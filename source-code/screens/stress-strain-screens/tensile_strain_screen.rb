#==============================================================================
# Watts
#
# @description: Module for providing functions to work with TensileStrainScreen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Tensile strain screen module (tensile_strain_screen.rb)

require_relative '../../elements/screen_header.rb'
require_relative '../../elements/screen_label.rb'
require_relative '../../elements/screen_edit_line.rb'

# Object definition
class TensileStrainScreen < Shoes

  url('/title_screen/stress_strain_screen/tensile_strain_screen',
      :tensile_strain_screen)

  # Draws the tensile strain screen on the Shoes app window.
  def tensile_strain_screen
    @heading = 'Tensile strain = extension / length'
    background('images/stress_strain_large.png')

    # Tensile strain screen header
    ScreenHeader.new(self, '/title_screen/stress_strain_screen', @@font, @heading)

    # Tensile strain screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:height => 640, :width => 80) do
      end
      # Content column
      stack(:height => 640, :width => 1000) do
        ScreenLabel.new(self, @@font, @heading, 'Extension')
        flow do
          @extension = ScreenEditLine.new(self, @@font, @heading)
          @extension_unit = para(strong(' m'))
          @extension_unit.style(@@screen_unit_text_styles)
        end

        ScreenLabel.new(self, @@font, @heading, 'Length')
        flow do
          @length = ScreenEditLine.new(self, @@font, @heading)
          @length_unit = para(strong(' m'))
          @length_unit.style(@@screen_unit_text_styles)
        end

        @calculate = button('Calculate')

        @result_display = flow

        @error_display = flow

        @calculate.click do
          @result_display.clear do
            @result = Joules.tensile_strain(@extension.text.to_f,
                                            @length.text.to_f)
            @tensile_strain = para(@result.to_s)
            @tensile_strain.style(@@screen_result_text_styles)
          end
        end
      end
    end
  end

end
