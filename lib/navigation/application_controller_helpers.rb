module Navigation
  module ApplicationControllerHelpers
    def self.included(sub)
      sub.extend(ClassMethods)
      sub.send(:helper_method,"navigation?")
    end

    def navigation?(name)
      name = "#{name}_navigation"
      defined?(name) && nav = self.send(name).present?
    end

    module ClassMethods
      def navigation(name,opts={})
        accessor_name = "#{opts.delete(:as) || name}_navigation"
        nav_class = "#{name}_navigation".classify.constantize
        init_method = "init_#{name}".to_sym

        self.send(:attr,accessor_name,true)
        self.send(:helper_method,accessor_name)
        self.send(:define_method,init_method) do
          self.send("#{accessor_name}=",nav_class.new(self,{}))
        end
        self.before_filter(init_method,opts)
      end
    end
  end
end
