# The Presentable module is used to add a `decorate` method to any class
module Presentable
  def decorate
    "#{self.class}Presenter".constantize.new(self)
  end
end
