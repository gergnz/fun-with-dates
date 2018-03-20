# frozen_string_literal: true

require 'spec_helper'
require_relative '../fun_with_dates.rb'

describe 'leapyear' do
  it 'should say true for 2000' do
    expect(leapyear(2000)).to eq TRUE
  end
  it 'should say true for 1980' do
    expect(leapyear(1980)).to eq TRUE
  end
  it 'should say false for 1900' do
    expect(leapyear(1900)).to eq FALSE
  end
  it 'should say false for 2100' do
    expect(leapyear(2100)).to eq FALSE
  end
  it 'should say false for 2101' do
    expect(leapyear(2101)).to eq FALSE
  end
end
