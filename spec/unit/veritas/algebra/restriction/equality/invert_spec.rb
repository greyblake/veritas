require File.expand_path('../../../../../../spec_helper', __FILE__)

describe 'Veritas::Algebra::Restriction::Equality#invert' do
  before do
    @attribute = Attribute::Integer.new(:id)

    @equality = @attribute.eq(1)
  end

  subject { @equality.invert }

  it { should eql(@attribute.ne(1)) }

  it 'should invert back to original' do
    subject.invert.should eql(@equality)
  end
end