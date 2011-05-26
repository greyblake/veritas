# encoding: utf-8

require 'spec_helper'

describe Aggregate::Sum, '#default' do
  subject { object.default }

  let(:object) { described_class.new(attribute) }

  context 'when the attribute is an Integer' do
    let(:attribute) { Attribute::Integer.new(:integer) }

    it { should eql(0) }
  end

  context 'when the attribute is a Float' do
    let(:attribute) { Attribute::Float.new(:float) }

    it { should eql(0.0) }
  end

  context 'when the attribute is a Decimal' do
    let(:attribute) { Attribute::Decimal.new(:decimal) }

    it { should eql(0.0) }
  end
end