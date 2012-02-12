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

    class Item < Group
      attr :label
      attr :url

      def group?; false; end

      def initialize(context,opts,&block)
        @url= opts.delete(:url)
        super(context,opts)
        @items = []
        @submenu = block if block_given?
      end

      def items
        if @submenu
          self.instance_eval(&@submenu)
          @submenu = nil
        end
        @items
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



    def item(label,url,&block)
      subopts = opts.clone.merge(:label=>label,:url=>url)
      @items<< Item.new(self,subopts,&block)
    end
  end
end
