#==============================================================================
# Watts
#
# @description: Module for providing functions to work with TrapeziumAreaScreen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Trapezium area screen module (trapezium_area_screen.rb)

require_relative '../../elements/screen_header.rb'
require_relative '../../elements/screen_label.rb'
require_relative '../../elements/screen_edit_line.rb'

# Object definition
class TrapeziumAreaScreen < Shoes

  url('/title_screen/geometry_screen/trapezium_area_screen',
      :trapezium_area_screen)

  # Draws the trapezium area screen on the Shoes app window.
  def trapezium_area_screen
    @heading = 'Trapezium area = 0.5 × (top base + bottom base) × height'
    background('images/geometry_large.png')

    # Trapezium area screen header
    ScreenHeader.new(self, '/title_screen/geometry_screen', @@font, @heading)

    # Trapezium area screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:height => 640, :width => 80) do
      end
      # Content column
      stack(:height => 640, :width => 1000) do
        ScreenLabel.new(self, @@font, @heading, 'Top base')
        flow do
          @top_base = ScreenEditLine.new(self, @@font, @heading)
          @top_base_units = ['cm', 'm', 'km', 'in', 'ft', 'yd', 'mi']
          @top_base_unit = list_box(:width => 100,
                                    :font => @@font,
                                    :items => @top_base_units)
          @top_base_unit.change do
            @bottom_base_unit.choose(@top_base_unit.text)
            @height_unit.choose(@top_base_unit.text)
          end
        end

        ScreenLabel.new(self, @@font, @heading, 'Bottom base')
        flow do
          @bottom_base = ScreenEditLine.new(self, @@font, @heading)
          @bottom_base_units = ['cm', 'm', 'km', 'in', 'ft', 'yd', 'mi']
          @bottom_base_unit = list_box(:width => 100,
                                       :font => @@font,
                                       :items => @bottom_base_units)
          @bottom_base_unit.change do
            @top_base_unit.choose(@bottom_base_unit.text)
            @height_unit.choose(@bottom_base_unit.text)
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
            @top_base_unit.choose(@height_unit.text)
            @bottom_base_unit.choose(@height_unit.text)
          end
        end

        @calculate = button('Calculate')

        @result_display = flow

        @error_display = flow

        @calculate.click do
          @result_display.clear do
            @result = Joules.trapezium_area(@top_base.text.to_f,
                                            @bottom_base.text.to_f,
                                            @height.text.to_f)
            @trapezium_area = para(@result.to_s)
            @trapezium_area_unit = para(" #{@top_base_unit.text}", sup('2'))
            @trapezium_area.style(@@screen_result_text_styles)
            @trapezium_area_unit.style(@@screen_result_text_styles)
          end
        end
      end
    end
  end

end
