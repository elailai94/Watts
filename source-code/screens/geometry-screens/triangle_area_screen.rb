#==============================================================================
# Watts
#
# @description: Module for providing functions to work with TriangleAreaScreen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Triangle area screen module (triangle_area_screen.rb)

require_relative '../../elements/screen_header.rb'
require_relative '../../elements/screen_label.rb'
require_relative '../../elements/screen_edit_line.rb'

# Object definition
class TriangleAreaScreen < Shoes

  url('/title_screen/geometry_screen/triangle_area_screen',
      :triangle_area_screen)

  # Draws the triangle area screen on the Shoes app window.
  def triangle_area_screen
    @heading = 'Triangle area = 0.5 × base × height'
    background('images/geometry_large.png')

    # Triangle area screen header
    ScreenHeader.new(self, '/title_screen/geometry_screen', @@font, @heading)

    # Triangle area screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:height => 640, :width => 80) do
      end
      # Content column
      stack(:height => 640, :width => 1000) do
        ScreenLabel.new(self, @@font, @heading, 'Base')
        flow do
          @base = ScreenEditLine.new(self, @@font, @heading)
          @base_units = ['cm', 'm', 'km', 'in', 'ft', 'yd', 'mi']
          @base_unit = list_box(:width => 100,
                                :font => @@font,
                                :items => @base_units)
          @base_unit.change do
            @height_unit.choose(@base_unit.text)
          end
        end

        ScreenLabel.new(self, @@font, @heading, 'Height')
        flow do
          @height = ScreenEditLine.new(self, @@font, @heading)
          @height_units = ['cm', 'm', 'km', 'in', 'ft', 'yd', 'mi']
          @height_unit = list_box(:width => 100,
                                  :font => @@font,
                                  :items => @height_units)
          @height_unit.change do
            @base_unit.choose(@height_unit.text)
          end
        end

        @calculate = button('Calculate')

        @result_display = flow

        @error_display = flow

        @calculate.click do
          @result_display.clear do
            @result = Joules.triangle_area(@base.text.to_f,
                                           @height.text.to_f)
            @triangle_area = para(@result.to_s)
            @triangle_area_unit = para(" #{@base_unit.text}", sup('2'))
            @triangle_area.style(@@screen_result_text_styles)
            @triangle_area_unit.style(@@screen_result_text_styles)
          end
        end
      end
    end
  end

end
