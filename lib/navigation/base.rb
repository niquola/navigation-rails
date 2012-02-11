module Navigation
  class Base
    def group?; true; end

    class Group < Base
      attr :label

      def initialize(context,opts)
        @label = opts.delete(:label)
        super(context,opts)
      end
    end

    attr :controller
    attr :opts

    def initialize(controller,opts={})
      @opts = opts
      @controller = controller
      @items=[]
    end

    def items
      draw if @items.empty?
      @items
    end

    def group(label=nil,&block)
      opts[:label] = label
      group = Group.new(self,opts)
      group.instance_eval(&block) if block_given?
      @items<< group
    end

    def method_missing(name,*args)
      controller.send(name,*args)
    end

    class Item
      attr :label
      attr :url

      def group?; false; end

      def initialize(label,url)
        @label,@url=label,url
      end
    end


    def item(label,url)
      @items<< Item.new(label,url)
    end
  end
end
