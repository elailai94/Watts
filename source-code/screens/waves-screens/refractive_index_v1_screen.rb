#==============================================================================
# Watts
#
# @description: Module for providing functions to work with RefractiveIndexV1Screen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Refractive index v1 screen module (refractive_index_v1_screen.rb)

require_relative '../../elements/screen_header.rb'
require_relative '../../elements/screen_label.rb'
require_relative '../../elements/screen_edit_line.rb'

# Object definition
class RefractiveIndexV1Screen < Shoes

  url('/title_screen/waves_screen/refractive_index_v1_screen',
      :refractive_index_v1_screen)

  # Draws the refractive index v1 screen on the Shoes app window.
  def refractive_index_v1_screen
    @heading = 'Refractive index = sine(angle of incidence) / sine(angle of refraction)'
    background('images/waves_large.png')

    # Refractive index v1 screen header
    ScreenHeader.new(self, '/title_screen/waves_screen', @@font, @heading)

    # Refractive index v1 screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:height => 640, :width => 80) do
      end
      # Content column
      stack(:height => 640, :width => 1000) do
        ScreenLabel.new(self, @@font, @heading, 'Angle of incidence')
        flow do
          @angle_of_incidence = ScreenEditLine.new(self, @@font, @heading)
          @angle_of_incidence_unit = para(strong(' deg'))
          @angle_of_incidence_unit.style(@@screen_unit_text_styles)
        end

        ScreenLabel.new(self, @@font, @heading, 'Angle of refraction')
        flow do
          @angle_of_refraction = ScreenEditLine.new(self, @@font, @heading)
          @angle_of_refraction_unit = para(strong(' deg'))
          @angle_of_refraction_unit.style(@@screen_unit_text_styles)
        end

        @calculate = button('Calculate')

        @result_display = flow

        @error_display = flow

        @calculate.click do
          @result_display.clear do
            @result = Joules.refractive_index_v1(@angle_of_incidence.text.to_f,
                                                 @angle_of_refraction.text.to_f)
            @refractive_index_v1 = para(@result.to_s)
            @refractive_index_v1.style(@@screen_result_text_styles)
          end
        end
      end
    end
  end

end
