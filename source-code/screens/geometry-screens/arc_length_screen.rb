#==============================================================================
# Watts
#
# @description: Module for providing functions to work with ArcLengthScreen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Arc length screen module (arc_length_screen.rb)

require_relative '../../elements/screen_header.rb'
require_relative '../../elements/screen_label.rb'
require_relative '../../elements/screen_edit_line.rb'

# Object definition
class ArcLengthScreen < Shoes

  url('/title_screen/geometry_screen/arc_length_screen',
      :arc_length_screen)

  # Draws the arc length screen on the Shoes app window.
  def arc_length_screen
    @heading = 'Arc length = radius × central angle'
    background('images/geometry_large.png')

    # Arc length screen header
    ScreenHeader.new(self, '/title_screen/geometry_screen', @@font, @heading)

    # Arc length screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:height => 640, :width => 80) do
      end
      # Content column
      stack(:height => 640, :width => 1000) do
        ScreenLabel.new(self, @@font, @heading, 'Radius')
        flow do
          @radius = ScreenEditLine.new(self, @@font, @heading)
          @radius_units = ['cm', 'm', 'km', 'in', 'ft', 'yd', 'mi']
          @radius_unit = list_box(:width => 100,
                                  :font => @@font,
                                  :items => @radius_units)
        end

        ScreenLabel.new(self, @@font, @heading, 'Central angle')
        flow do
          @central_angle = ScreenEditLine.new(self, @@font, @heading)
          @central_angle_unit = para(strong(' rad'))
          @central_angle_unit.style(@@screen_unit_text_styles)
        end

        @calculate = button('Calculate')

        @result_display = flow

        @error_display = flow

        @calculate.click do
          @result_display.clear do
            @result = Joules.arc_length(@radius.text.to_f,
                                        @central_angle.text.to_f)
            @arc_length = para(@result.to_s)
            @arc_length_unit = para(" #{@radius_unit.text}")
            @arc_length.style(@@screen_result_text_styles)
            @arc_length_unit.style(@@screen_result_text_styles)
          end
        end
      end
    end
  end

end
