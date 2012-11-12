require "routes_for_page/version"

#module RoutesForPage
  ## Your code goes here...
#end
module ActionDispatch
  module Routing
    class Mapper
      module Resources
        def add_route(action, options) # :nodoc:
          path = path_for_action(action, options.delete(:path))

          if action.to_s =~ /^[\w\/]+$/
            options[:action] ||= action unless action.to_s.include?("/")
          else
            action = nil
          end

          if !options.fetch(:as, true)
            options.delete(:as)
          else
            options[:as] = name_for_action(options[:as], action)
          end

          mapping = Mapping.new(@set, @scope, path, options)
          app, conditions, requirements, defaults, as, anchor = mapping.to_route
          # add new routes for index
          if defaults[:action] == 'index'
            new_mapping = Mapping.new(@set, @scope, path, options)

            new_app, new_conditions, new_requirements, new_defaults, new_as, new_anchor = mapping.to_route
            new_as = nil
            new_requirements.merge!({:page=>/[2-9]|\d{2,}/})
            controller_name = new_defaults[:controller]
            new_conditions[:path_info] = new_conditions[:path_info].gsub(controller_name,controller_name + '(/page/:page)') unless /page/ =~ new_conditions[:path_info]
            @set.add_route(new_app, new_conditions, new_requirements, new_defaults, new_as, new_anchor)
            #app, conditions, requirements, defaults, as, anchor = mapping.to_route
            new_2_defaults = defaults.merge(page: 1)
            @set.add_route(app, conditions, requirements, new_2_defaults, as, anchor)
          else

            # end add new routes for index
            @set.add_route(app, conditions, requirements, defaults, as, anchor)
          end

        end
      end
    end
  end
end
