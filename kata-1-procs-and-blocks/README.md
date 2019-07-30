# Dependency injection framework to abuse procs, blocks and lamdas

## Getting started
- Checkout repo
- run bundle install

## Dependency Injection framework
   for simplicity sake, we will be making use of constructor injection
  
   ### Dependency injection Framework
   A dependency injection framework manages all of your classes dependencies and runtimes based on certain conventions
   Typically for this to work you need the framework to wrap around all of your running code so that it can do its thing, without being wrapped
   around your code it cannot manage your code.
  
   Typically there are 4 steps to it
   1.  Registration: this can be done explicitly or through metaprogramming. On application startup your framework will
        load up all of your dependencies, and register them with their lifetime scopes so that it knows how to resolve instances
   
   2.  build dependency trees, once all classes are registered, it will traverse through all of its registrations
        and figure out what needs to be resolved before it. This is done recursively.
  
   3. Resolution at app runtime, when the code is executed, it will evaluate the specified keys and create instances based on the configurations
  
   4. Disposing: after the code is run, it looks at the instances created and determines whether the instance should be discarded or not

   ### Lifetime Scopes:
  -  instance per dependency: everytime the dependency is required it creates a new instance of the object
  - instance per request: for every use of the dependency, a single instance is used, the next call will require a new instance (think active record models and caching)
  - instance per lifetime: While the application is running, there will only be a single instance used regardless of the amount of requests (think a singleton)
  
   if no lifetime scope is provided, instance per request is the default

## The dependency injection framework we will be building

for something different we will be creating a convention based constructor injector where each constructor parameter can either be a class or proc/lamda.
### Implementing
  the framework will be written in `services/application_composer.rb`
  and a "simulation" of an application startup for testing and messing around will be in `services/runtime_app.rb`
### The convention:
  - on startup we will register the class with its constructor parameter name and lifetime scope. It should be able to accept a block in order to use the application config to determine which class gets assigned to the key.
  for example:
  ```ruby
    @context.register(:i_am_the_main_class) { @runtime_params[:v] ? ApplicationComposer::MainClass : ApplicationComposer::DependentOne }
  ```
### The dependencies
 - Each registered key should have a comprehensive dependency tree assigned to it.
 example:
 ```ruby
  :i_am_the_main_class=>{:i_am_the_main_class=>[{:i_am_dependency=>[:some_lamda]}, :some_other]},
     :i_am_dependency=>{:i_am_dependency=>[:some_lamda]}
 ```
 based on the implementation the tree itself might look slightly different (actually could be more condensed). This is fine as long as its clear what is required to resolve the instance based on the parameters.

 ### Resolving
 for brevity, we will go without using named parameters (the implementation is very similar but there's no real value in adding that extra, you can if you want though)
 when we resolve a key, it must use the dependency tree to instantiate all the instances with its constructor parameters automatically

```ruby
   @context.resolve(:i_am_the_main_class).do_some_method 
 ```

 ### Running
 this will be the code block all of our application will be running inside.
this should be able to except either a block, proc or lamda.
once either of the above have been executed, it should deal with the existing lifetime scopes
examples:
```ruby
  lamda = -> (context) { context.resolve(:i_am_the_main_class).do_some_method }
  @context.run lamda
```
or
```ruby
 @context.run { @context.resolve(:i_am_the_main_class).do_some_method }
```

### Specs
I haven't been able to complete specs yet, but they might be coming soon tm.

### Supplementary reading

https://www.rubyguides.com/2016/02/ruby-procs-and-lambdas/

https://medium.com/podiihq/ruby-blocks-procs-and-lambdas-bb6233f68843

https://medium.com/@sihui/what-the-heck-are-code-blocks-procs-lambdas-and-closures-in-ruby-2b0737f08e95

https://blog.appsignal.com/2018/09/04/ruby-magic-closures-in-ruby-blocks-procs-and-lambdas.html

https://martinfowler.com/articles/injection.html

https://deviq.com/dependency-inversion-principle/

https://en.wikipedia.org/wiki/Dependency_inversion_principle

https://en.wikipedia.org/wiki/Composition_over_inheritance