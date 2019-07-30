require 'spec_helper'

describe "Main#hello_world" do
  subject { Main.hello_world }
  it { expect(subject).to eq('Hello World') }
end
