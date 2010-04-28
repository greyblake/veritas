require File.expand_path('../../../../../../spec_helper', __FILE__)

describe 'Veritas::Logic::Connective::Negation#rename' do
  before do
    @attribute = Attribute::Integer.new(:id)
    @other     = Attribute::Integer.new(:other_id)
    @aliases   = { @attribute.name => @other.name }
  end

  subject { @negation.rename(@aliases) }

  describe 'operand is renamed' do
    before do
      @operand  = @attribute.eq(1)
      @negation = Logic::Connective::Negation.new(@operand)
    end

    it { should eql(Logic::Connective::Negation.new(@other.eq(1))) }
  end

  describe 'operand is not renamed' do
    before do
      @operand  = @other.eq(1)
      @negation = Logic::Connective::Negation.new(@operand)
    end

    it { should equal(@negation) }
  end
end
