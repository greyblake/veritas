require File.expand_path('../../../../../../spec_helper', __FILE__)
require File.expand_path('../fixtures/classes', __FILE__)

describe 'Veritas::Logic::Connective::BinaryConnective#call' do
  before do
    @header   = Relation::Header.new([ [ :id, Integer ] ])
    @left     = Logic::Predicate::Equality.new(@header[:id], 1)
    @right    = Logic::Predicate::Equality.new(@header[:id], 2)
    @tuple    = Tuple.new(@header, [ 1 ])
    @response = mock('#eval response')

    @connective = BinaryConnectiveSpecs::Object.new(@left, @right)

    BinaryConnectiveSpecs::Object.should_receive(:eval).with(true, false).and_return(@response)
  end

  subject { @connective.call(@tuple) }

  it { should equal(@response) }
end
