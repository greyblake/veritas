require 'spec_helper'
require File.expand_path('../../fixtures/classes', __FILE__)

shared_examples_for 'memoizes method' do
  it 'memoizes the instance method' do
    subject
    object = klass.new
    object.send(method).should equal(object.send(method))
  end

  it 'adds a private method' do
    count = klass.private_instance_methods.count
    expect { subject }.to change { klass.private_instance_methods.count }.from(count).to(count + 1)
  end
end

describe 'Veritas::Immutable::ModuleMethods#memoize' do
  subject { klass.memoize(method) }

  let(:klass) { Class.new(ImmutableSpecs::Object) }

  context 'public method' do
    let(:method) { :public_method }

    it { should equal(klass) }

    it_should_behave_like 'memoizes method'

    it 'is still a public method' do
      should be_public_method_defined(method)
    end
  end

  context 'protected method' do
    let(:method) { :protected_method }

    it { should equal(klass) }

    it_should_behave_like 'memoizes method'

    it 'is still a protected method' do
      should be_protected_method_defined(method)
    end
  end

  context 'private method' do
    let(:method) { :private_method }

    it { should equal(klass) }

    it_should_behave_like 'memoizes method'

    it 'is still a private method' do
      should be_private_method_defined(method)
    end
  end
end
