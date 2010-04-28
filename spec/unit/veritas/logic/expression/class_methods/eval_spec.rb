require File.expand_path('../../../../../../spec_helper', __FILE__)

describe 'Veritas::Logic::Expression::ClassMethods#eval' do
  before do
    @klass = Class.new do
      include Logic::Expression

      def self.name
        'AnonymousClass'
      end
    end
  end

  subject { @klass.eval }

  it { method(:subject).should raise_error(NotImplementedError, 'AnonymousClass.eval must be implemented') }
end
