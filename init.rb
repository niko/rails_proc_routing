require 'restorm/routing/routing_with_proc'
require 'action_controller/routing'

ActionController::Routing::Route.send :include,
  Restorm::Routing::RouteExtensions
