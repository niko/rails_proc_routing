module Restorm
  module Routing
    
    module RouteExtensions
        def self.included(base)
          base.alias_method_chain :recognition_conditions, :proc
        end

        def recognition_conditions_with_proc
          result = recognition_conditions_without_proc
          result << "(conditions[:proc].call(path,env))" if conditions[:proc]
          result
        end
      end
    
  end
end