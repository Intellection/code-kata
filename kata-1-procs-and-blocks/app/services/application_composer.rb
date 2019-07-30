class ApplicationComposer
  def initialize
    @registry = {}
    @dependency_tree = {}
    @lifetime_scopes = { instance_per_lifetime: {}, instance_per_request: {} }
  end

  # dependency registration can be done through extreme metaprogramming
  # one of the most common types is convention-based registration
  # rails makes use of this, where it scans folder names and matches the underlying namespaces
  # and folder structures to match the ruby to its loading.
  # that's not the purpose of this exercise, so we will be going with explicit registration
  # which is less dry, but far simpler to implement

  def start
    build_dependency_trees
  end

  #The application will go through here to run all of its code
  # it needs to work with both blocks and lamdas
  def run(lamda, &block)
  end

  # We must register the constructor key, with a block that assigns the required
  # class or lamda to the key, along with the lifetime_scope
  def register(key, lifetime_scope = :instance_per_request, &block)
  end

  # We must parse through each registered key, and use its class to determine what other dependencies
  # it has on initialization, it is reasonable to assume a proc is a leaf node and has no dependencies
  # This is optional: a solution can be provided on request
  # Pro tip: you can find all constructor params with
  # dependencies = @registry[key].instance_method(:initialize).parameters.map { |c| c[1] }
  def build_dependency_trees
  end

  #this will create the instance of your key, it must recursively pass through your
  # dependency tree, and create an instance by passing in the resolved params into the class based on the specified lifetime scope
  # Pro tip: breadth first works wonders.
  def resolve(key)
  end

  #Some empty test classes

  class MainClass
    attr_reader :i_am_a_child

    def initialize(i_am_dependency, some_other)
      @i_am_dependency = i_am_dependency
      @some_other = some_other
    end

    def print
      puts "#{@i_am_dependency}#{@some_other}"
    end
  end

  class DependentOne
    def initialize(some_lamda)
      @some_lamda = some_lamda
    end
  end

  class SomeOther
  end

  class SomeLamda
  end
end
