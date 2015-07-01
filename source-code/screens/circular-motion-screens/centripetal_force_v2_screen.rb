#==============================================================================
# Watts
#
# @description: Module for providing functions to work with CentripetalForceV2Screen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Centripetal force v2 screen module (centripetal_force_v2_screen.rb)

require_relative '../../elements/screen_label.rb'
require_relative '../../elements/screen_edit_line.rb'

# Object definition
class CentripetalForceV2Screen < Shoes

  url('/title_screen/circular_motion_screen/centripetal_force_v2_screen',
      :centripetal_force_v2_screen)

  # Draws the centripetal force v2 screen on the Shoes app window.
  def centripetal_force_v2_screen
    background('images/circular_motion_large.png')

    # Centripetal force v2 screen header
    flow(:height => 80, :width => 1080, :scroll => false) do
      @back_button = image('images/back_icon_white.png',
                           :click => '/title_screen/circular_motion_screen')
      @heading = title('Centripetal force = mass x angular velocity',
                       sup('2'), ' x radius')
      @back_button.style(@@screen_header_image_styles)
      @heading.style(@@screen_header_text_styles)
    end

    # Centripetal force v2 screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:height => 640, :width => 80) do
      end
      # Content column
      stack(:height => 640, :width => 1000) do
        @heading_edited = @heading.text
        ScreenLabel.new(self, @@font, @heading_edited, 'Mass')
        flow do
          @mass = ScreenEditLine.new(self, @@font, @heading_edited)
          @mass_unit = para(strong(' kg'))
          @mass_unit.style(@@screen_unit_text_styles)
        end

        ScreenLabel.new(self, @@font, @heading_edited, 'Angular velocity')
        flow do
          @angular_velocity = ScreenEditLine.new(self, @@font, @heading_edited)
          @angular_velocity_unit = para(strong(' rads'), strong(sup('-1')))
          @angular_velocity_unit.style(@@screen_unit_text_styles)
        end

        ScreenLabel.new(self, @@font, @heading_edited, 'Radius')
        flow do
          @radius = ScreenEditLine.new(self, @@font, @heading_edited)
          @radius_unit = para(strong(' m'))
          @radius_unit.style(@@screen_unit_text_styles)
        end

        @calculate = button('Calculate')

        @result_display = flow

        @error_display = flow

        @calculate.click do
          @result_display.clear do
            @result = Joules.centripetal_force_v2(@mass.text.to_f,
                                                  @angular_velocity.text.to_f,
                                                  @radius.text.to_f)
            @centripetal_force_v2 = para(@result.to_s)
            @centripetal_force_v2_unit = para(' N')
            @centripetal_force_v2.style(@@screen_result_text_styles)
            @centripetal_force_v2_unit.style(@@screen_result_text_styles)
          end
        end
      end
    end
  end

end
