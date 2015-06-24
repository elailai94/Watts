#==============================================================================
# Watts
#
# @description: Module for providing functions to work with WeightScreen
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Weight screen module (weight_screen.rb)

require_relative '../../elements/screen_header.rb'
require_relative '../../elements/screen_label.rb'
require_relative '../../elements/screen_edit_line.rb'

# Object definition
class WeightScreen < Shoes

  url('/title_screen/mass_weight_screen/weight_screen',
  	  :weight_screen)

  # Draws the weight screen on the Shoes app window.
  def weight_screen
    @heading = 'Weight = mass × acceleration of free fall'
    background('../images/mass_weight_large.png')

    # Weight screen header
    ScreenHeader.new(self, '/title_screen/mass_weight_screen', @@font, @heading)

    # Weight screen content
    flow(:height => 640, :width => 1080, :scroll => true) do
      # Left margin offset
      stack(:height => 640, :width => 80) do
      end
      # Content column 
      stack(:height => 640, :width => 1000) do
        ScreenLabel.new(self, @@font, @heading, 'Mass')
        flow do
          @mass = ScreenEditLine.new(self, @@font, @heading)
          @mass_unit = para(strong(' kg'))
          @mass_unit.style(@@screen_unit_text_styles)
        end

        @calculate = button('Calculate')
        
        @result_display = flow

        @error_display = flow
        
        @calculate.click do
          @result_display.clear do
            @result = Joules.weight(@mass.text.to_f)
            @weight = para(@result.to_s)
            @weight_unit = para(' N')
            @weight.style(@@screen_result_text_styles)
            @weight_unit.style(@@screen_result_text_styles)
          end
        end
      end
    end
  end
	
end
