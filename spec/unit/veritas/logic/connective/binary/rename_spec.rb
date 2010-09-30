require 'spec_helper'
require File.expand_path('../fixtures/classes', __FILE__)

describe 'Veritas::Logic::Connective::Binary#rename' do
  subject { object.rename(aliases) }

  let(:klass)     { BinarySpecs::Object                                       }
  let(:attribute) { Attribute::Integer.new(:id)                               }
  let(:other)     { attribute.rename(:other_id)                               }
  let(:header)    { Relation::Header.new([ attribute ])                       }
  let(:aliases)   { Algebra::Rename::Aliases.coerce(header, :id => :other_id) }
  let(:object)    { klass.new(left, right)                                    }

  context 'left and right are renamed' do
    let(:left)  { attribute.eq(1) }
    let(:right) { attribute.eq(2) }

    it { should eql(klass.new(other.eq(1), other.eq(2))) }
  end

  context 'left is renamed' do
    let(:left)  { attribute.eq(1) }
    let(:right) { other.eq(2)     }

    it { should eql(klass.new(other.eq(1), other.eq(2))) }
  end

  context 'right is renamed' do
    let(:left)  { other.eq(1)     }
    let(:right) { attribute.eq(2) }

    it { should eql(klass.new(other.eq(1), other.eq(2))) }
  end

  context 'right and right are not renamed' do
    let(:left)  { other.eq(1) }
    let(:right) { other.eq(2) }

    it { should equal(object) }
  end
end
