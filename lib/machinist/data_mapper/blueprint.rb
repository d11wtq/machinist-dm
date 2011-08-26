module Machinist::DataMapper
  class Blueprint < Machinist::Blueprint
    # Make and save an object.
    def make!(attributes = {})
      object = make(attributes)
      object.raise_on_save_failure = true
      object.save && object.reload
    end

    def box(object)
      object.key
    end

    def unbox(key)
      @klass.get(*key)
    end

    def outside_transaction
      yield # FIXME: This is not actually implemented
    end

    def lathe_class #:nodoc:
      Machinist::DataMapper::Lathe
    end
  end
end
