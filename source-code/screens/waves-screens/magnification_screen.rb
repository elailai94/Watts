#==============================================================================
# Watts
#
# @description: Module for providing functions to work with MagnificationScreen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Magnification screen module (magnification_screen.rb)

require_relative '../../elements/screen_header.rb'
require_relative '../../elements/screen_label.rb'
require_relative '../../elements/screen_edit_line.rb'

# Object definition
class MagnificationScreen < Shoes

  url('/title_screen/waves_screen/magnification_screen',
      :magnification_screen)

  # Draws the magnification screen on the Shoes app window.
  def magnification_screen
    @heading = 'Magnification = image height / object height'
    background('images/waves_large.png')

    # Magnification screen header
    ScreenHeader.new(self, '/title_screen/waves_screen', @@font, @heading)

    # Magnification screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:height => 640, :width => 80) do
      end
      # Content column
      stack(:height => 640, :width => 1000) do
        ScreenLabel.new(self, @@font, @heading, 'Image height')
        flow do
          @image_height = ScreenEditLine.new(self, @@font, @heading)
          @image_height_unit = para(strong(' m'))
          @image_height_unit.style(@@screen_unit_text_styles)
        end

        ScreenLabel.new(self, @@font, @heading, 'Object height')
        flow do
          @object_height = ScreenEditLine.new(self, @@font, @heading)
          @object_height_unit = para(strong(' m'))
          @object_height_unit.style(@@screen_unit_text_styles)
        end

        @calculate = button('Calculate')

        @result_display = flow

        @error_display = flow

        @calculate.click do
          @result_display.clear do
            @result = Joules.magnification(@image_height.text.to_f,
                                           @object_height.text.to_f)
            @magnification = para(@result.to_s)
            @magnification.style(@@screen_result_text_styles)
          end
        end
      end
    end
  end

end
