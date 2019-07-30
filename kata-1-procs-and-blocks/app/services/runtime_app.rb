class RuntimeApp
  def initialize(runtime_params)
    @runtime_params = runtime_params
    @runtime_params = { v: true }
    @context = ApplicationComposer.new
    register_dependencies
    @context.start
  end

  def test
    la = -> (context) { context.resolve(:i_am_the_main_class).do_some_method }
    @context.run la
  end

  def register_dependencies
    @context.register(:i_am_the_main_class) { @runtime_params[:v] ? ApplicationComposer::MainClass : ApplicationComposer::DependentOne }
    @context.register(:i_am_dependency, :instance_per_lifetime) { ApplicationComposer::DependentOne }
    @context.register(:some_other) { ApplicationComposer::SomeOther }
    @context.register(:some_lamda) { -> { puts "yay" } }
  end
end
