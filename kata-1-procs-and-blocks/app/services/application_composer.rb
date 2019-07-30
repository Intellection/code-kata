class ApplicationComposer
  # for simplicity sake, we will be making use of constructor injection
  #
  #
  # Lifetime Scopes:
  #  - instance per dependency: everytime the dependency is required it creates a new instance of the object
  #  - instance per request: for every use of the dependency, a single instance is used, the next call will require a new instance (think active record models and caching)
  #  - instance per lifetime: While the application is running, there will only be a single instance used regardless of the amount of requests (think a singleton)
  #
  # if no lifetime scope is provided, instance per request is the default

  def initialize
    @registry = {}
    @dependency_tree = {}
    @lifetime_scopes = { instance_per_lifetime: {}, instance_per_request: {} }
    register_dependencies
    build_dependency_trees
  end

  # dependency registration can be done through extreme metaprogramming
  # one of the most common types is convention-based registration
  # rails makes use of this, where it scans folder names and matches the underlying namespaces
  # and folder structures to match the ruby to its loading.
  # that's not the purpose of this exercise, so we will be going with explicit registration
  # which is less dry, but far simpler to implement

  def register_dependencies
    register(:i_am_the_main_class) { MainClass }
    register(:i_am_dependency, :instance_per_lifetime) { DependentOne }
    register(:some_other) { SomeOther }
    register(:some_lamda) { -> { puts "yay" } }
  end

  def register(key, lifetime_scope = :instance_per_request, &block)
    @registry[key] = { lifetime: lifetime_scope, value: block.call }
  end

  def build_dependency_trees
    @registry.each do |key, value|
      @dependency_tree[key] = get_dependencies(key)
    end
  end

  def get_dependencies(key)
    if @registry[key][:value].is_a?(Proc)
      return key
    elsif @registry[key][:value].is_a?(Class)
      dependencies = @registry[key][:value].instance_method(:initialize).parameters.map { |c| c[1] }
      if dependencies.size == 0
        return key
      else
        tree = {}
        tree[key] = []
        dependencies.each do |dependency|
          dependency_keys = get_dependencies(dependency.to_sym)
          tree[key] << dependency_keys
        end
        tree
      end
    end
  end

  def resolve(key)
    resolve_dependencies(key, @dependency_tree[key])
  end

  def resolve_dependencies(key, dependencies)
    if @registry[key][:value].is_a?(Proc)
      return @registry[key][:value]
    elsif @registry[key][:value].is_a?(Class)
      if dependencies == nil || dependencies[key] == nil || dependencies.size == 0
        return instance_for_lifetime(key)
      else
        params = []
        dependencies[key].each do |dependency|
          param_instances = nil
          if dependency.is_a?(Hash)
            dependency.each do |k, v|
              param_instances = resolve_dependencies(k, dependency)
            end
          else
            param_instances = resolve_dependencies(dependency, nil)
          end
          params << param_instances
        end
        instance_for_lifetime(key, params)
      end
    end
  end

  def instance_for_lifetime(key, params = nil)
    if @registry[key][:lifetime] == :instance_per_dependency
      @registry[key].new(*params)
    else
      if already_created = @lifetime_scopes[@registry[key][:lifetime]][key]
        return already_created
      else
        instance = params == nil ? @registry[key][:value].new : @registry[key][:value].new(*params)
        @lifetime_scopes[@registry[key][:lifetime]][key] = instance
        instance
      end
    end
  end

  #unnamed paramaters

  class MainClass
    attr_reader :i_am_a_child

    def initialize(i_am_dependency, some_other)
      @i_am_dependency = i_am_dependency
      @some_other = some_other
    end

    def print
      puts "#{@i_am_a_child}#{@some_other}"
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
