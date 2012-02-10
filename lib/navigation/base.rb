module Navigation
  class Base

    attr :items
    attr :controller

    def initialize(controller,opts)
      @opts = opts
      @controller = controller
      @items=[]
      draw
    end

    def method_missing(name,*args)
      if controller.respond_to?(name)
        controller.send(name,*args)
      else
        super
      end
    end

    class Item
      attr :label
      attr :url
      def initialize(label,url)
        @label,@url=label,url
      end
    end


    def item(label,url)
      @items<< Item.new(label,url)
    end
  end
end
