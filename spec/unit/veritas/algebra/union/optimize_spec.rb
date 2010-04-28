require File.expand_path('../../../../../spec_helper', __FILE__)

describe 'Veritas::Algebra::Union#optimize' do
  before do
    @header = [ [ :id, Integer ] ]
    @left   = Relation.new(@header, [ [ 1 ] ])
    @right  = Relation.new(@header, [ [ 2 ] ])
  end

  subject { @union.optimize }

  describe 'left is an empty relation' do
    before do
      @left = Relation::Empty.new(@header)

      @union = Algebra::Union.new(@left, @right)
    end

    it { should equal(@right) }

    it 'returns an equivalent relation to the unoptimized operation' do
      should == @union
    end
  end

  describe 'right is an empty relation' do
    before do
      @right = Relation::Empty.new(@header)

      @union = Algebra::Union.new(@left, @right)
    end

    it { should equal(@left) }

    it 'returns an equivalent relation to the unoptimized operation' do
      should == @union
    end
  end

  describe 'left is an empty relation when optimized' do
    before do
      @left = Algebra::Restriction.new(@left, Logic::Proposition::False.instance)

      @union = Algebra::Union.new(@left, @right)
    end

    it { should equal(@right) }

    it 'returns an equivalent relation to the unoptimized operation' do
      should == @union
    end
  end

  describe 'right is an empty relation when optimized' do
    before do
      @right = Algebra::Restriction.new(@right, Logic::Proposition::False.instance)

      @union = Algebra::Union.new(@left, @right)
    end

    it { should equal(@left) }

    it 'returns an equivalent relation to the unoptimized operation' do
      should == @union
    end
  end

  describe 'left and right are not empty relations' do
    before do
      @union = Algebra::Union.new(@left, @right)
    end

    it { should equal(@union) }
  end

  describe 'left and right are equivalent relations' do
    before do
      @right = @left.dup

      @union = Algebra::Union.new(@left, @right)
    end

    it { should equal(@left) }

    it 'returns an equivalent relation to the unoptimized operation' do
      should == @union
    end
  end
end
