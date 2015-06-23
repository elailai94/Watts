#==============================================================================
# Watts
#
# @description: Module for providing data validation methods
#   objects
# @author: Elisha Lai
# @version: 0.0.1 15/06/2015
#==============================================================================

# Data validation module (data_validation.rb)

module DataValidation
  module_function

  #@!group Data Type Check Methods

  class String
    def numeric?
      Float(self) != nil rescue false
    end
  end

  #@!endgroup

  #@!group Data Validation Methods

  #def greater_than(data, )
  	
  #end


end