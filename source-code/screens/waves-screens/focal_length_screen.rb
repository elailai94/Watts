#==============================================================================
# Watts
#
# @description: Module for providing functions to work with FocalLengthScreen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Focal length screen module (focal_length_screen.rb)

require_relative '../../elements/screen_header.rb'
require_relative '../../elements/screen_label.rb'
require_relative '../../elements/screen_edit_line.rb'

# Object definition
class FocalLengthScreen < Shoes

  url('/title_screen/waves_screen/focal_length_screen',
      :focal_length_screen)

  # Draws the focal length screen on the Shoes app window.
  def focal_length_screen
    @heading = 'Focal length = 1 / ((1 / object_distance) + (1 / image_distance))'
    background('images/waves_large.png')

    # Focal length screen header
    ScreenHeader.new(self, '/title_screen/waves_screen', @@font, @heading)

    # Focal length screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:height => 640, :width => 80) do
      end
      # Content column
      stack(:height => 640, :width => 1000) do
        ScreenLabel.new(self, @@font, @heading, 'Object distance')
        flow do
          @object_distance = ScreenEditLine.new(self, @@font, @heading)
          @object_distance_unit = para(strong(' m'))
          @object_distance_unit.style(@@screen_unit_text_styles)
        end

        ScreenLabel.new(self, @@font, @heading, 'Image distance')
        flow do
          @image_distance = ScreenEditLine.new(self, @@font, @heading)
          @image_distance_unit = para(strong(' m'))
          @image_distance_unit.style(@@screen_unit_text_styles)
        end

        @calculate = button('Calculate')

        @result_display = flow

        @error_display = flow

        @calculate.click do
          @result_display.clear do
            @result = Joules.focal_length(@object_distance.text.to_f,
                                          @image_distance.text.to_f)
            @focal_length = para(@result.to_s)
            @focal_length_unit = para(' m')
            @focal_length.style(@@screen_result_text_styles)
            @focal_length_unit.style(@@screen_result_text_styles)
          end
        end
      end
    end
  end

end
