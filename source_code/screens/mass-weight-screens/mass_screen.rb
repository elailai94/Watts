#==============================================================================
# Watts
#
# @description: Module for providing functions to work with MassScreen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Mass screen module (mass_screen.rb)

require_relative '../../elements/screen_header.rb'
require_relative '../../elements/screen_label.rb'
require_relative '../../elements/screen_edit_line.rb'

# Object definition
class MassScreen < Shoes

  url('/title_screen/mass_weight_screen/mass_screen',
      :mass_screen)

  # Draws the mass screen on the Shoes app window.
  def mass_screen
    @heading = 'Mass = weight / acceleration of free fall'
    background('../images/mass_weight_large.png')

    # Mass screen header
    ScreenHeader.new(self, '/title_screen/mass_weight_screen', @@font, @heading)

    # Mass screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:height => 640, :width => 80) do
      end
      # Content column 
      stack(:height => 640, :width => 1000) do
        ScreenLabel.new(self, @@font, @heading, 'Weight')
        flow do
          @weight = ScreenEditLine.new(self, @@font, @heading)
          @weight_unit = para(strong(' N'))
          @weight_unit.style(@@screen_unit_text_styles)
        end

        @calculate = button('Calculate')
        
        @result_display = flow

        @error_display = flow
        
        @calculate.click do
          @result_display.clear do
            @result = Joules.mass(@weight.text.to_f)
            @mass = para(@result.to_s)
            @mass_unit = para(' kg')
            @mass.style(@@screen_result_text_styles)
            @mass_unit.style(@@screen_result_text_styles)
          end
        end
      end
    end
  end
	
end
