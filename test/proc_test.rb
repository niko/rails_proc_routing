require "#{File.dirname(__FILE__)}/test_helper"

class ProcTest < Test::Unit::TestCase
  def setup
    ActionController::Routing::Routes.draw do |map|
      map.connect '/green',
        :controller => 'public',
        :action => 'green',
        :conditions => {
          :proc => Proc.new{ |path,env| true }
        }
      map.connect '/red',
        :controller => 'public',
        :action => 'red',
        :conditions => {
          :proc => Proc.new{ |path,env| false }
        }
    end
  end

  def test_simple_proc_true
    request = new_request "http://www.happystuff.test/green"
    assert_recognizes_from_request request, :controller => "public", :action => "green"
  end
  def test_simple_proc_false
    request = new_request "http://www.happystuff.test/red"
    assert_raises( ActionController::RoutingError ){ ActionController::Routing::Routes.recognize(request) }
  end

end