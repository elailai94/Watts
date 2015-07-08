#==============================================================================
# Watts
#
# @description: Module for providing functions to work with GeometryScreen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Geometry screen module (geometry_screen.rb)

require_relative '../elements/screen_header.rb'
require_relative '../elements/screen_box.rb'

require_relative 'geometry-screens/arc_length_screen.rb'
require_relative 'geometry-screens/circumference_screen.rb'
require_relative 'geometry-screens/triangle_area_screen.rb'
require_relative 'geometry-screens/trapezium_area_screen.rb'

# Object definition
class GeometryScreen < Shoes

  url('/title_screen/geometry_screen',
      :geometry_screen)

  # Draws the geometry screen on the Shoes app window.
  def geometry_screen
    @heading = 'Geometry'
    @heading_edited = @heading.downcase.gsub(/[,&]/,'').squeeze(' ').gsub(' ','_')
    background("images/#{@heading_edited}_large.png")

    # Geometry screen header
    ScreenHeader.new(self, '/title_screen', @@font, @heading)

    # Geometry screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:height => 750, :width => 80) do
      end
      # Content column
      stack(:height => 750, :width => 1000) do
        @formula_set =
          {'Arc length' => 'Arc length = radius × central angle',
           'Circumference' => 'Circumference = 2π × radius',
           'Triangle area' => 'Triangle area = 0.5 × base × height',
           'Trapezium area' => 'Trapezium area = 0.5 × (top base + bottom base) × height',
           'Rectangle area' => 'Rectangle area = length × width',
           'Cylinder surface area' => 'Cylinder surface area = 2π × radius × height'}
        @formula_set.each do |name, formula|
          ScreenBox.new(self, @@theme_colour, @@font, @heading, formula, name)
        end

        stack(:height => 100, :width => 940, :margin => 2) do
          background(@@theme_colour)
          @circle_area = para('Circle area = π × radius', sup('2'))
          @circle_area.style(@@screen_box_text_styles)
          click do
            visit("/title_screen/#{@heading_edited}_screen/circle_area_screen")
          end
        end
      end
    end
  end

end
